// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_support_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteSupportConfig {

 String get phone; String get email;
/// Create a copy of RemoteSupportConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteSupportConfigCopyWith<RemoteSupportConfig> get copyWith => _$RemoteSupportConfigCopyWithImpl<RemoteSupportConfig>(this as RemoteSupportConfig, _$identity);

  /// Serializes this RemoteSupportConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteSupportConfig&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,email);

@override
String toString() {
  return 'RemoteSupportConfig(phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class $RemoteSupportConfigCopyWith<$Res>  {
  factory $RemoteSupportConfigCopyWith(RemoteSupportConfig value, $Res Function(RemoteSupportConfig) _then) = _$RemoteSupportConfigCopyWithImpl;
@useResult
$Res call({
 String phone, String email
});




}
/// @nodoc
class _$RemoteSupportConfigCopyWithImpl<$Res>
    implements $RemoteSupportConfigCopyWith<$Res> {
  _$RemoteSupportConfigCopyWithImpl(this._self, this._then);

  final RemoteSupportConfig _self;
  final $Res Function(RemoteSupportConfig) _then;

/// Create a copy of RemoteSupportConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? email = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoteSupportConfig].
extension RemoteSupportConfigPatterns on RemoteSupportConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteSupportConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteSupportConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteSupportConfig value)  $default,){
final _that = this;
switch (_that) {
case _RemoteSupportConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteSupportConfig value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteSupportConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteSupportConfig() when $default != null:
return $default(_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  String email)  $default,) {final _that = this;
switch (_that) {
case _RemoteSupportConfig():
return $default(_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  String email)?  $default,) {final _that = this;
switch (_that) {
case _RemoteSupportConfig() when $default != null:
return $default(_that.phone,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RemoteSupportConfig implements RemoteSupportConfig {
  const _RemoteSupportConfig({required this.phone, required this.email});
  factory _RemoteSupportConfig.fromJson(Map<String, dynamic> json) => _$RemoteSupportConfigFromJson(json);

@override final  String phone;
@override final  String email;

/// Create a copy of RemoteSupportConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteSupportConfigCopyWith<_RemoteSupportConfig> get copyWith => __$RemoteSupportConfigCopyWithImpl<_RemoteSupportConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoteSupportConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteSupportConfig&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,email);

@override
String toString() {
  return 'RemoteSupportConfig(phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class _$RemoteSupportConfigCopyWith<$Res> implements $RemoteSupportConfigCopyWith<$Res> {
  factory _$RemoteSupportConfigCopyWith(_RemoteSupportConfig value, $Res Function(_RemoteSupportConfig) _then) = __$RemoteSupportConfigCopyWithImpl;
@override @useResult
$Res call({
 String phone, String email
});




}
/// @nodoc
class __$RemoteSupportConfigCopyWithImpl<$Res>
    implements _$RemoteSupportConfigCopyWith<$Res> {
  __$RemoteSupportConfigCopyWithImpl(this._self, this._then);

  final _RemoteSupportConfig _self;
  final $Res Function(_RemoteSupportConfig) _then;

/// Create a copy of RemoteSupportConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? email = null,}) {
  return _then(_RemoteSupportConfig(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
