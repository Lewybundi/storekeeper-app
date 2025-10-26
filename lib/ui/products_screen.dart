import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/database/db.dart';
import 'package:shop/providers/product_providers.dart';
import 'package:shop/ui/add_edit_product_screen.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productListProvider);
    final totalValue = ref.watch(totalInventoryValueProvider);
    final lowStockProducts = ref.watch(lowStockProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.dashboard),
            onPressed: () => _showDashboard(context, totalValue, lowStockProducts),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(productListProvider.notifier).refresh(),
          ),
        ],
      ),
      body: productsAsync.when(
        data: (products) {
          if (products.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inventory_2_outlined, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    'No products yet',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add your first product to get started',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }
          return Column(
            children: [
              _buildSearchBar(context, ref, products),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => ref.read(productListProvider.notifier).refresh(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return _buildProductCard(context, ref, product);
                    },
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(productListProvider.notifier).refresh(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEditDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Add Product'),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, WidgetRef ref, List<ProductData> products) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search products...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
        ),
        onChanged: (query) {
          ref.read(productSearchProvider.notifier).search(query, products);
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, WidgetRef ref, ProductData product) {
    final isLowStock = product.quantity < 10;
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: _buildProductImage(product.productImage),
        title: Text(
          product.product,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('Price: \$${product.price.toStringAsFixed(2)}'),
            const SizedBox(height: 2),
            Row(
              children: [
                Text('Quantity: ${product.quantity}'),
                if (isLowStock) ...[
                  const SizedBox(width: 8),
                  Chip(
                    label: const Text('Low Stock', style: TextStyle(fontSize: 10)),
                    backgroundColor: Colors.orange.shade100,
                    padding: EdgeInsets.zero,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 2),
            Text(
              'Total: \$${(product.price * product.quantity).toStringAsFixed(2)}',
              style: TextStyle(color: Colors.green.shade700, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () => _showAddEditDialog(context, ref, product: product),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _showDeleteConfirmation(context, ref, product),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(Uint8List? imageData) {
    if (imageData != null && imageData.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.memory(
          imageData,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      );
    }
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.inventory_2, size: 32, color: Colors.grey),
    );
  }

  void _showDashboard(BuildContext context, double totalValue, List<ProductData> lowStock) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Inventory Dashboard'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _dashboardItem(
              'Total Inventory Value',
              '\$${totalValue.toStringAsFixed(2)}',
              Icons.attach_money,
              Colors.green,
            ),
            const SizedBox(height: 16),
            _dashboardItem(
              'Low Stock Products',
              '${lowStock.length}',
              Icons.warning,
              Colors.orange,
            ),
            if (lowStock.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text('Low Stock Items:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...lowStock.map((p) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text('• ${p.product} (${p.quantity})'),
              )),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _dashboardItem(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha:0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha:0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(color: Colors.grey.shade700, fontSize: 12)),
              const SizedBox(height: 4),
              Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref, ProductData product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Product'),
        content: Text('Are you sure you want to delete "${product.product}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(productListProvider.notifier).deleteProduct(product.id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Product deleted')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showAddEditDialog(BuildContext context, WidgetRef ref, {ProductData? product}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditProductScreen(product: product),
      ),
    );
  }
}
