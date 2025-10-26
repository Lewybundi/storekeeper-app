# Product Management App

A Flutter-based product inventory management application with local database storage, image support, and real-time inventory tracking.

## Features

### 📦 Product Management
- **Add Products**: Create new products with name, quantity, price, and images
- **Edit Products**: Update existing product information
- **Delete Products**: Remove products with confirmation dialog
- **Image Support**: Attach product images using device camera or gallery

### 🔍 Search & Filter
- Real-time product search by name
- Instant filtering as you type

### 📊 Inventory Dashboard
- **Total Inventory Value**: Calculate total worth of all products
- **Low Stock Alerts**: Automatic warnings for products with quantity < 10
- **Quick Overview**: View key metrics at a glance

### 💾 Data Persistence
- Local SQLite database using Drift
- Automatic data synchronization
- Offline-first architecture

## Screenshots

> Add screenshots of your app here

## Tech Stack

### Core Technologies
- **Flutter**: UI framework
- **Dart**: Programming language

### State Management
- **Riverpod**: Modern reactive state management
- StateNotifier for complex state
- AsyncValue for async operations

### Database
- **Drift**: Type-safe SQL database wrapper
- SQLite for local storage
- Automatic migration support

### Dependencies
- `flutter_riverpod: ^2.5.1` - State management
- `drift: ^2.16.0` - Database ORM
- `drift_flutter: ^0.1.0` - Flutter integration for Drift
- `get_it: ^7.6.7` - Service locator / dependency injection
- `image_picker: ^1.0.7` - Image selection from gallery/camera
- `path_provider: ^2.1.2` - File system paths

### Dev Dependencies
- `drift_dev: ^2.16.0` - Code generation for Drift
- `build_runner: ^2.4.8` - Build system

## Project Structure

```
lib/
├── main.dart                      # App entry point
├── database/
│   ├── db.dart                    # Database configuration
│   ├── db.g.dart                  # Generated database code
│   └── tables.dart                # Table definitions
├── repository/
│   └── products_repo.dart         # Data access layer
├── providers/
│   └── product_providers.dart     # Riverpod providers
├── screens/
│   └── products_screen.dart       # UI screens
└── service/
    └── locator.dart               # Service locator setup
```

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/product-management-app.git
   cd product-management-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate database code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Configuration

#### Database Schema
The app uses a single `Product` table with the following structure:

| Column | Type | Description |
|--------|------|-------------|
| id | INTEGER | Primary key (auto-increment) |
| product | TEXT | Product name (3-30 characters) |
| quantity | INTEGER | Stock quantity |
| price | REAL | Product price |
| productImage | BLOB | Product image (optional) |
| createdAt | DATETIME | Creation timestamp |

## Usage

### Adding a Product
1. Tap the **"Add Product"** floating action button
2. Tap the image placeholder to select a product image (optional)
3. Enter product name, quantity, and price
4. Tap **"Add Product"** to save

### Editing a Product
1. Tap the **edit icon** (pencil) on any product card
2. Modify the product details
3. Tap **"Update Product"** to save changes

### Deleting a Product
1. Tap the **delete icon** (trash) on any product card
2. Confirm deletion in the dialog

### Viewing Dashboard
1. Tap the **dashboard icon** in the app bar
2. View total inventory value and low stock alerts

### Searching Products
1. Type in the search bar at the top
2. Results filter automatically as you type

## Architecture

### State Management Pattern
```
UI Layer (Widgets)
    ↕
Providers (Riverpod)
    ↕
Repository Layer
    ↕
Database (Drift/SQLite)
```

### Key Providers

- **`productListProvider`**: Manages the list of all products
- **`productByIdProvider`**: Fetches a single product by ID
- **`productSearchProvider`**: Handles search/filter functionality
- **`totalInventoryValueProvider`**: Calculates total inventory worth
- **`lowStockProductsProvider`**: Filters products with low stock

## Features in Detail

### Low Stock Monitoring
Products with quantity less than 10 are automatically flagged:
- Orange badge on product cards
- Listed in dashboard
- Visual warning indicators

### Inventory Calculations
- **Total Value**: `Σ(price × quantity)` for all products
- Real-time updates when products change
- Displayed in dashboard with currency formatting

### Image Handling
- Images stored as BLOB in database
- Compressed for efficient storage
- Displayed with proper aspect ratio
- Placeholder shown when no image available

## Error Handling

The app includes comprehensive error handling:
- Database operation failures
- Image picker cancellations
- Form validation errors
- Network-independent operation

## Performance Optimizations

- **Lazy Loading**: Products loaded on demand
- **Efficient Rebuilds**: Riverpod minimizes unnecessary widget rebuilds
- **Database Indexing**: Fast queries with proper indexing
- **Image Compression**: Optimized image sizes

## Building for Production

### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## Testing

### Run Tests
```bash
flutter test
```

### Generate Coverage
```bash
flutter test --coverage
```

## Troubleshooting

### Common Issues

**Issue**: Build runner fails
```bash
# Solution: Clean and rebuild
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

**Issue**: Database not found
```bash
# Solution: Clear app data or reinstall
flutter clean
flutter run
```

**Issue**: Image picker not working
- Ensure permissions are configured in AndroidManifest.xml and Info.plist
- Check device/emulator has camera/gallery access

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Future Enhancements

- [ ] Export data to CSV/Excel
- [ ] Barcode scanning for products
- [ ] Product categories and tags
- [ ] Sales tracking and analytics
- [ ] Multi-user support with cloud sync
- [ ] Print labels and reports
- [ ] Dark mode improvements
- [ ] Product history and audit logs

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter team for the amazing framework
- Riverpod for excellent state management
- Drift team for the powerful database solution

## Contact

Your Name - [@yourtwitter](https://twitter.com/yourtwitter) - your.email@example.com

Project Link: [https://github.com/yourusername/product-management-app](https://github.com/yourusername/product-management-app)

---

Made with ❤️ using Flutter