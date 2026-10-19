import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playbook_polymorphism/features/factory/model/product_type.dart';

part 'product.freezed.dart';
part 'product.g.dart';

/// A bank product as the backend describes it (pure data, no UI). Money is in
/// whole cents, see `CentsFormat`.
@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    @JsonKey(unknownEnumValue: ProductType.unknown) required ProductType type,
    @JsonKey(name: 'balance_cents') required int balanceCents,

    /// Deposits only, in percent per year.
    @JsonKey(name: 'interest_rate') double? interestRate,

    /// Credit products only.
    @JsonKey(name: 'credit_limit_cents') int? creditLimitCents,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
