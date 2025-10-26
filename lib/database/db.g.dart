// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $ProductTable extends Product with TableInfo<$ProductTable, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _productMeta = const VerificationMeta(
    'product',
  );
  @override
  late final GeneratedColumn<String> product = GeneratedColumn<String>(
    'product',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productImageMeta = const VerificationMeta(
    'productImage',
  );
  @override
  late final GeneratedColumn<Uint8List> productImage =
      GeneratedColumn<Uint8List>(
        'product_image',
        aliasedName,
        true,
        type: DriftSqlType.blob,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    product,
    quantity,
    price,
    productImage,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product')) {
      context.handle(
        _productMeta,
        product.isAcceptableOrUnknown(data['product']!, _productMeta),
      );
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('product_image')) {
      context.handle(
        _productImageMeta,
        productImage.isAcceptableOrUnknown(
          data['product_image']!,
          _productImageMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      product: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      productImage: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}product_image'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProductTable createAlias(String alias) {
    return $ProductTable(attachedDatabase, alias);
  }
}

class ProductData extends DataClass implements Insertable<ProductData> {
  final int id;
  final String product;
  final int quantity;
  final double price;
  final Uint8List? productImage;
  final DateTime createdAt;
  const ProductData({
    required this.id,
    required this.product,
    required this.quantity,
    required this.price,
    this.productImage,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product'] = Variable<String>(product);
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || productImage != null) {
      map['product_image'] = Variable<Uint8List>(productImage);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProductCompanion toCompanion(bool nullToAbsent) {
    return ProductCompanion(
      id: Value(id),
      product: Value(product),
      quantity: Value(quantity),
      price: Value(price),
      productImage: productImage == null && nullToAbsent
          ? const Value.absent()
          : Value(productImage),
      createdAt: Value(createdAt),
    );
  }

  factory ProductData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductData(
      id: serializer.fromJson<int>(json['id']),
      product: serializer.fromJson<String>(json['product']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<double>(json['price']),
      productImage: serializer.fromJson<Uint8List?>(json['productImage']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'product': serializer.toJson<String>(product),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<double>(price),
      'productImage': serializer.toJson<Uint8List?>(productImage),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProductData copyWith({
    int? id,
    String? product,
    int? quantity,
    double? price,
    Value<Uint8List?> productImage = const Value.absent(),
    DateTime? createdAt,
  }) => ProductData(
    id: id ?? this.id,
    product: product ?? this.product,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
    productImage: productImage.present ? productImage.value : this.productImage,
    createdAt: createdAt ?? this.createdAt,
  );
  ProductData copyWithCompanion(ProductCompanion data) {
    return ProductData(
      id: data.id.present ? data.id.value : this.id,
      product: data.product.present ? data.product.value : this.product,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
      productImage: data.productImage.present
          ? data.productImage.value
          : this.productImage,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('id: $id, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('productImage: $productImage, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    product,
    quantity,
    price,
    $driftBlobEquality.hash(productImage),
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.product == this.product &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          $driftBlobEquality.equals(other.productImage, this.productImage) &&
          other.createdAt == this.createdAt);
}

class ProductCompanion extends UpdateCompanion<ProductData> {
  final Value<int> id;
  final Value<String> product;
  final Value<int> quantity;
  final Value<double> price;
  final Value<Uint8List?> productImage;
  final Value<DateTime> createdAt;
  const ProductCompanion({
    this.id = const Value.absent(),
    this.product = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.productImage = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProductCompanion.insert({
    this.id = const Value.absent(),
    required String product,
    required int quantity,
    required double price,
    this.productImage = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : product = Value(product),
       quantity = Value(quantity),
       price = Value(price);
  static Insertable<ProductData> custom({
    Expression<int>? id,
    Expression<String>? product,
    Expression<int>? quantity,
    Expression<double>? price,
    Expression<Uint8List>? productImage,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (product != null) 'product': product,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (productImage != null) 'product_image': productImage,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProductCompanion copyWith({
    Value<int>? id,
    Value<String>? product,
    Value<int>? quantity,
    Value<double>? price,
    Value<Uint8List?>? productImage,
    Value<DateTime>? createdAt,
  }) {
    return ProductCompanion(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      productImage: productImage ?? this.productImage,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(product.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (productImage.present) {
      map['product_image'] = Variable<Uint8List>(productImage.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCompanion(')
          ..write('id: $id, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('productImage: $productImage, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$Appdb extends GeneratedDatabase {
  _$Appdb(QueryExecutor e) : super(e);
  $AppdbManager get managers => $AppdbManager(this);
  late final $ProductTable product = $ProductTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [product];
}

typedef $$ProductTableCreateCompanionBuilder =
    ProductCompanion Function({
      Value<int> id,
      required String product,
      required int quantity,
      required double price,
      Value<Uint8List?> productImage,
      Value<DateTime> createdAt,
    });
typedef $$ProductTableUpdateCompanionBuilder =
    ProductCompanion Function({
      Value<int> id,
      Value<String> product,
      Value<int> quantity,
      Value<double> price,
      Value<Uint8List?> productImage,
      Value<DateTime> createdAt,
    });

class $$ProductTableFilterComposer extends Composer<_$Appdb, $ProductTable> {
  $$ProductTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get productImage => $composableBuilder(
    column: $table.productImage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductTableOrderingComposer extends Composer<_$Appdb, $ProductTable> {
  $$ProductTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get productImage => $composableBuilder(
    column: $table.productImage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductTableAnnotationComposer
    extends Composer<_$Appdb, $ProductTable> {
  $$ProductTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<Uint8List> get productImage => $composableBuilder(
    column: $table.productImage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProductTableTableManager
    extends
        RootTableManager<
          _$Appdb,
          $ProductTable,
          ProductData,
          $$ProductTableFilterComposer,
          $$ProductTableOrderingComposer,
          $$ProductTableAnnotationComposer,
          $$ProductTableCreateCompanionBuilder,
          $$ProductTableUpdateCompanionBuilder,
          (ProductData, BaseReferences<_$Appdb, $ProductTable, ProductData>),
          ProductData,
          PrefetchHooks Function()
        > {
  $$ProductTableTableManager(_$Appdb db, $ProductTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> product = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<Uint8List?> productImage = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProductCompanion(
                id: id,
                product: product,
                quantity: quantity,
                price: price,
                productImage: productImage,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String product,
                required int quantity,
                required double price,
                Value<Uint8List?> productImage = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProductCompanion.insert(
                id: id,
                product: product,
                quantity: quantity,
                price: price,
                productImage: productImage,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductTableProcessedTableManager =
    ProcessedTableManager<
      _$Appdb,
      $ProductTable,
      ProductData,
      $$ProductTableFilterComposer,
      $$ProductTableOrderingComposer,
      $$ProductTableAnnotationComposer,
      $$ProductTableCreateCompanionBuilder,
      $$ProductTableUpdateCompanionBuilder,
      (ProductData, BaseReferences<_$Appdb, $ProductTable, ProductData>),
      ProductData,
      PrefetchHooks Function()
    >;

class $AppdbManager {
  final _$Appdb _db;
  $AppdbManager(this._db);
  $$ProductTableTableManager get product =>
      $$ProductTableTableManager(_db, _db.product);
}
