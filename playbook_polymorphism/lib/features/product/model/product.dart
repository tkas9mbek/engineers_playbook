import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playbook_polymorphism/features/product/model/product_type.dart';

part 'product.freezed.dart';
part 'product.g.dart';

/// A bank product as the backend describes it (pure data, no UI).
@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    @JsonKey(unknownEnumValue: ProductType.unknown) required ProductType type,
    required double balance,

    /// Deposits only, in percent per year.
    @JsonKey(name: 'interest_rate') double? interestRate,

    /// Credit products only.
    @JsonKey(name: 'credit_limit') double? creditLimit,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
