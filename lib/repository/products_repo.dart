import 'dart:developer';
import 'package:shop/database/db.dart';
import 'package:shop/service/locator.dart';

class ProductsRepo {
  Appdb db = locator.get<Appdb>();
  Future<List<ProductData>> getAllProducts() async {
    try {
      return await db.select(db.product).get();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  getProductsById(int id) async {
    try {
      return await (db.select(
        db.product,
      )..where((t) => t.id.equals(id))).getSingle();
    } catch (e) {
      log(e.toString());
    }
  }

  addProduct(ProductCompanion pc) async {
    try {
      return await db.into(db.product).insert(pc);
    } catch (e) {
      log(e.toString());
    }
  }

  updateProduct(ProductCompanion pc) async {
    try {
      return await db.update(db.product).replace(pc);
    } catch (e) {
      log(e.toString());
    }
  }

  deleteProduct(int id) async {
    try {
      return await (db.delete(
        db.product,
      )..where((product) => product.id.equals(id))).go();
    } catch (e) {
      log(e.toString());
    }
  }
}
