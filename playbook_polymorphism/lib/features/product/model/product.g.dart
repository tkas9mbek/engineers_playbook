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
  balance: (json['balance'] as num).toDouble(),
  interestRate: (json['interest_rate'] as num?)?.toDouble(),
  creditLimit: (json['credit_limit'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': _$ProductTypeEnumMap[instance.type]!,
  'balance': instance.balance,
  'interest_rate': instance.interestRate,
  'credit_limit': instance.creditLimit,
};

const _$ProductTypeEnumMap = {
  ProductType.debit: 'debit',
  ProductType.deposit: 'deposit',
  ProductType.credit: 'credit',
  ProductType.unknown: 'unknown',
};
