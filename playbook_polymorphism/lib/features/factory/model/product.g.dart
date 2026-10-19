// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String,
  name: json['name'] as String,
  type: $enumDecode(
    _$ProductTypeEnumMap,
    json['type'],
    unknownValue: ProductType.unknown,
  ),
  balanceCents: (json['balance_cents'] as num).toInt(),
  interestRate: (json['interest_rate'] as num?)?.toDouble(),
  creditLimitCents: (json['credit_limit_cents'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': _$ProductTypeEnumMap[instance.type]!,
  'balance_cents': instance.balanceCents,
  'interest_rate': instance.interestRate,
  'credit_limit_cents': instance.creditLimitCents,
};

const _$ProductTypeEnumMap = {
  ProductType.debit: 'debit',
  ProductType.deposit: 'deposit',
  ProductType.credit: 'credit',
  ProductType.unknown: 'unknown',
};
