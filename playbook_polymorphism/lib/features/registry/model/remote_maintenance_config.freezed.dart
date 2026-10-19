// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_maintenance_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteMaintenanceConfig {

 bool get enabled; String get message;
/// Create a copy of RemoteMaintenanceConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteMaintenanceConfigCopyWith<RemoteMaintenanceConfig> get copyWith => _$RemoteMaintenanceConfigCopyWithImpl<RemoteMaintenanceConfig>(this as RemoteMaintenanceConfig, _$identity);

  /// Serializes this RemoteMaintenanceConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteMaintenanceConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,message);

@override
String toString() {
  return 'RemoteMaintenanceConfig(enabled: $enabled, message: $message)';
}


}

/// @nodoc
abstract mixin class $RemoteMaintenanceConfigCopyWith<$Res>  {
  factory $RemoteMaintenanceConfigCopyWith(RemoteMaintenanceConfig value, $Res Function(RemoteMaintenanceConfig) _then) = _$RemoteMaintenanceConfigCopyWithImpl;
@useResult
$Res call({
 bool enabled, String message
});




}
/// @nodoc
class _$RemoteMaintenanceConfigCopyWithImpl<$Res>
    implements $RemoteMaintenanceConfigCopyWith<$Res> {
  _$RemoteMaintenanceConfigCopyWithImpl(this._self, this._then);

  final RemoteMaintenanceConfig _self;
  final $Res Function(RemoteMaintenanceConfig) _then;

/// Create a copy of RemoteMaintenanceConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? message = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoteMaintenanceConfig].
extension RemoteMaintenanceConfigPatterns on RemoteMaintenanceConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteMaintenanceConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteMaintenanceConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteMaintenanceConfig value)  $default,){
final _that = this;
switch (_that) {
case _RemoteMaintenanceConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteMaintenanceConfig value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteMaintenanceConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteMaintenanceConfig() when $default != null:
return $default(_that.enabled,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  String message)  $default,) {final _that = this;
switch (_that) {
case _RemoteMaintenanceConfig():
return $default(_that.enabled,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  String message)?  $default,) {final _that = this;
switch (_that) {
case _RemoteMaintenanceConfig() when $default != null:
return $default(_that.enabled,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RemoteMaintenanceConfig implements RemoteMaintenanceConfig {
  const _RemoteMaintenanceConfig({required this.enabled, required this.message});
  factory _RemoteMaintenanceConfig.fromJson(Map<String, dynamic> json) => _$RemoteMaintenanceConfigFromJson(json);

@override final  bool enabled;
@override final  String message;

/// Create a copy of RemoteMaintenanceConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteMaintenanceConfigCopyWith<_RemoteMaintenanceConfig> get copyWith => __$RemoteMaintenanceConfigCopyWithImpl<_RemoteMaintenanceConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoteMaintenanceConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteMaintenanceConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,message);

@override
String toString() {
  return 'RemoteMaintenanceConfig(enabled: $enabled, message: $message)';
}


}

/// @nodoc
abstract mixin class _$RemoteMaintenanceConfigCopyWith<$Res> implements $RemoteMaintenanceConfigCopyWith<$Res> {
  factory _$RemoteMaintenanceConfigCopyWith(_RemoteMaintenanceConfig value, $Res Function(_RemoteMaintenanceConfig) _then) = __$RemoteMaintenanceConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, String message
});




}
/// @nodoc
class __$RemoteMaintenanceConfigCopyWithImpl<$Res>
    implements _$RemoteMaintenanceConfigCopyWith<$Res> {
  __$RemoteMaintenanceConfigCopyWithImpl(this._self, this._then);

  final _RemoteMaintenanceConfig _self;
  final $Res Function(_RemoteMaintenanceConfig) _then;

/// Create a copy of RemoteMaintenanceConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? message = null,}) {
  return _then(_RemoteMaintenanceConfig(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
