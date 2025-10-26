import 'package:get_it/get_it.dart';
import 'package:shop/database/db.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register database instance as singleton
  locator.registerSingleton<Appdb>(Appdb());
}
