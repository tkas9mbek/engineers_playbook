// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_limits_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteLimitsConfig {

@JsonKey(name: 'daily_cents') int get dailyCents;@JsonKey(name: 'per_transfer_cents') int get perTransferCents;
/// Create a copy of RemoteLimitsConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteLimitsConfigCopyWith<RemoteLimitsConfig> get copyWith => _$RemoteLimitsConfigCopyWithImpl<RemoteLimitsConfig>(this as RemoteLimitsConfig, _$identity);

  /// Serializes this RemoteLimitsConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteLimitsConfig&&(identical(other.dailyCents, dailyCents) || other.dailyCents == dailyCents)&&(identical(other.perTransferCents, perTransferCents) || other.perTransferCents == perTransferCents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dailyCents,perTransferCents);

@override
String toString() {
  return 'RemoteLimitsConfig(dailyCents: $dailyCents, perTransferCents: $perTransferCents)';
}


}

/// @nodoc
abstract mixin class $RemoteLimitsConfigCopyWith<$Res>  {
  factory $RemoteLimitsConfigCopyWith(RemoteLimitsConfig value, $Res Function(RemoteLimitsConfig) _then) = _$RemoteLimitsConfigCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'daily_cents') int dailyCents,@JsonKey(name: 'per_transfer_cents') int perTransferCents
});




}
/// @nodoc
class _$RemoteLimitsConfigCopyWithImpl<$Res>
    implements $RemoteLimitsConfigCopyWith<$Res> {
  _$RemoteLimitsConfigCopyWithImpl(this._self, this._then);

  final RemoteLimitsConfig _self;
  final $Res Function(RemoteLimitsConfig) _then;

/// Create a copy of RemoteLimitsConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dailyCents = null,Object? perTransferCents = null,}) {
  return _then(_self.copyWith(
dailyCents: null == dailyCents ? _self.dailyCents : dailyCents // ignore: cast_nullable_to_non_nullable
as int,perTransferCents: null == perTransferCents ? _self.perTransferCents : perTransferCents // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoteLimitsConfig].
extension RemoteLimitsConfigPatterns on RemoteLimitsConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteLimitsConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteLimitsConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteLimitsConfig value)  $default,){
final _that = this;
switch (_that) {
case _RemoteLimitsConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteLimitsConfig value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteLimitsConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'daily_cents')  int dailyCents, @JsonKey(name: 'per_transfer_cents')  int perTransferCents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteLimitsConfig() when $default != null:
return $default(_that.dailyCents,_that.perTransferCents);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'daily_cents')  int dailyCents, @JsonKey(name: 'per_transfer_cents')  int perTransferCents)  $default,) {final _that = this;
switch (_that) {
case _RemoteLimitsConfig():
return $default(_that.dailyCents,_that.perTransferCents);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'daily_cents')  int dailyCents, @JsonKey(name: 'per_transfer_cents')  int perTransferCents)?  $default,) {final _that = this;
switch (_that) {
case _RemoteLimitsConfig() when $default != null:
return $default(_that.dailyCents,_that.perTransferCents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RemoteLimitsConfig implements RemoteLimitsConfig {
  const _RemoteLimitsConfig({@JsonKey(name: 'daily_cents') required this.dailyCents, @JsonKey(name: 'per_transfer_cents') required this.perTransferCents});
  factory _RemoteLimitsConfig.fromJson(Map<String, dynamic> json) => _$RemoteLimitsConfigFromJson(json);

@override@JsonKey(name: 'daily_cents') final  int dailyCents;
@override@JsonKey(name: 'per_transfer_cents') final  int perTransferCents;

/// Create a copy of RemoteLimitsConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteLimitsConfigCopyWith<_RemoteLimitsConfig> get copyWith => __$RemoteLimitsConfigCopyWithImpl<_RemoteLimitsConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoteLimitsConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteLimitsConfig&&(identical(other.dailyCents, dailyCents) || other.dailyCents == dailyCents)&&(identical(other.perTransferCents, perTransferCents) || other.perTransferCents == perTransferCents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dailyCents,perTransferCents);

@override
String toString() {
  return 'RemoteLimitsConfig(dailyCents: $dailyCents, perTransferCents: $perTransferCents)';
}


}

/// @nodoc
abstract mixin class _$RemoteLimitsConfigCopyWith<$Res> implements $RemoteLimitsConfigCopyWith<$Res> {
  factory _$RemoteLimitsConfigCopyWith(_RemoteLimitsConfig value, $Res Function(_RemoteLimitsConfig) _then) = __$RemoteLimitsConfigCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'daily_cents') int dailyCents,@JsonKey(name: 'per_transfer_cents') int perTransferCents
});




}
/// @nodoc
class __$RemoteLimitsConfigCopyWithImpl<$Res>
    implements _$RemoteLimitsConfigCopyWith<$Res> {
  __$RemoteLimitsConfigCopyWithImpl(this._self, this._then);

  final _RemoteLimitsConfig _self;
  final $Res Function(_RemoteLimitsConfig) _then;

/// Create a copy of RemoteLimitsConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dailyCents = null,Object? perTransferCents = null,}) {
  return _then(_RemoteLimitsConfig(
dailyCents: null == dailyCents ? _self.dailyCents : dailyCents // ignore: cast_nullable_to_non_nullable
as int,perTransferCents: null == perTransferCents ? _self.perTransferCents : perTransferCents // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
