import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop/database/tables.dart';
part 'db.g.dart';

@DriftDatabase(tables: [Product])
class Appdb extends _$Appdb {
  Appdb([QueryExecutor? executor]) : super(executor ?? _openConnection());
  @override
  int get schemaVersion => 1;
  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'products',
      native: DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}