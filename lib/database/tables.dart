import 'package:drift/drift.dart';

class Product extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get product => text().withLength(min: 3, max: 30)();
  IntColumn get quantity => integer()();
  RealColumn get price => real()();
  BlobColumn get productImage => blob().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
