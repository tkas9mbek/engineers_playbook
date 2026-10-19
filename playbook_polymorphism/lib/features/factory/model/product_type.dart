import 'package:json_annotation/json_annotation.dart';

/// The kind of product the backend returns, as a closed set.
///
/// No labels, icons or colors here: those are UI concerns and live in
/// `ProductUiModel`. A value the app doesn't know yet becomes [unknown]
/// (see `Product`), so a new backend value doesn't crash older app versions.
enum ProductType {
  @JsonValue('debit')
  debit,
  @JsonValue('deposit')
  deposit,
  @JsonValue('credit')
  credit,
  unknown,
}
