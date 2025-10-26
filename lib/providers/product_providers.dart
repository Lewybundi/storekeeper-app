import 'dart:typed_data';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shop/database/db.dart';
import 'package:shop/repository/products_repo.dart';

// Provider for the repository
final productRepoProvider = Provider<ProductsRepo>((ref) {
  return ProductsRepo();
});

// Provider for all products list
final productListProvider = StateNotifierProvider<ProductListNotifier, AsyncValue<List<ProductData>>>((ref) {
  return ProductListNotifier(ref);
});

class ProductListNotifier extends StateNotifier<AsyncValue<List<ProductData>>> {
  final Ref ref;
  
  ProductListNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(productRepoProvider);
      return await repo.getAllProducts();
    });
  }

  Future<void> refresh() async {
    await _loadProducts();
  }

  Future<void> addProduct({
    required String product,
    required int quantity,
    required double price,
    Uint8List? productImage,
  }) async {
    final repo = ref.read(productRepoProvider);
    
    final companion = ProductCompanion(
      product: drift.Value(product),
      quantity: drift.Value(quantity),
      price: drift.Value(price),
      productImage: drift.Value(productImage),
    );

    await repo.addProduct(companion);
    await refresh();
  }

  Future<void> updateProduct({
    required int id,
    required String product,
    required int quantity,
    required double price,
    Uint8List? productImage,
  }) async {
    final repo = ref.read(productRepoProvider);
    
    final companion = ProductCompanion(
      id: drift.Value(id),
      product: drift.Value(product),
      quantity: drift.Value(quantity),
      price: drift.Value(price),
      productImage: drift.Value(productImage),
    );

    await repo.updateProduct(companion);
    await refresh();
  }

  Future<void> deleteProduct(int id) async {
    final repo = ref.read(productRepoProvider);
    await repo.deleteProduct(id);
    await refresh();
  }
}

// Provider for a single product by ID
final productByIdProvider = FutureProvider.family<ProductData?, int>((ref, id) async {
  final repo = ref.read(productRepoProvider);
  return await repo.getProductsById(id);
});

// Provider for search/filter functionality
final productSearchProvider = StateNotifierProvider<ProductSearchNotifier, List<ProductData>>((ref) {
  return ProductSearchNotifier();
});

class ProductSearchNotifier extends StateNotifier<List<ProductData>> {
  ProductSearchNotifier() : super([]);

  void search(String query, List<ProductData> allProducts) {
    if (query.isEmpty) {
      state = allProducts;
    } else {
      state = allProducts
          .where((product) =>
              product.product.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void clear() {
    state = [];
  }
}

// Provider for total inventory value
final totalInventoryValueProvider = Provider<double>((ref) {
  final productsAsync = ref.watch(productListProvider);
  
  return productsAsync.when(
    data: (products) {
      return products.fold(
        0.0,
        (sum, product) => sum + (product.price * product.quantity),
      );
    },
    loading: () => 0.0,
    error: (_, __) => 0.0,
  );
});

// Provider for low stock products (quantity < 10)
final lowStockProductsProvider = Provider<List<ProductData>>((ref) {
  final productsAsync = ref.watch(productListProvider);
  
  return productsAsync.when(
    data: (products) {
      return products.where((product) => product.quantity < 10).toList();
    },
    loading: () => [],
    error: (_, __) => [],
  );
});
