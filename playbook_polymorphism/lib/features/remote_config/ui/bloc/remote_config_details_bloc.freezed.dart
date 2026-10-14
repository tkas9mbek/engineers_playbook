// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteConfigDetailsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteConfigDetailsEvent()';
}


}

/// @nodoc
class $RemoteConfigDetailsEventCopyWith<$Res>  {
$RemoteConfigDetailsEventCopyWith(RemoteConfigDetailsEvent _, $Res Function(RemoteConfigDetailsEvent) __);
}


/// Adds pattern-matching-related methods to [RemoteConfigDetailsEvent].
extension RemoteConfigDetailsEventPatterns on RemoteConfigDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RequestedRemoteConfigDetailsEvent value)?  requested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestedRemoteConfigDetailsEvent() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RequestedRemoteConfigDetailsEvent value)  requested,}){
final _that = this;
switch (_that) {
case _RequestedRemoteConfigDetailsEvent():
return requested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RequestedRemoteConfigDetailsEvent value)?  requested,}){
final _that = this;
switch (_that) {
case _RequestedRemoteConfigDetailsEvent() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  requested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestedRemoteConfigDetailsEvent() when requested != null:
return requested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  requested,}) {final _that = this;
switch (_that) {
case _RequestedRemoteConfigDetailsEvent():
return requested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  requested,}) {final _that = this;
switch (_that) {
case _RequestedRemoteConfigDetailsEvent() when requested != null:
return requested();case _:
  return null;

}
}

}

/// @nodoc


class _RequestedRemoteConfigDetailsEvent implements RemoteConfigDetailsEvent {
  const _RequestedRemoteConfigDetailsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestedRemoteConfigDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteConfigDetailsEvent.requested()';
}


}

/// @nodoc
class _$RequestedRemoteConfigDetailsEventCopyWith<$Res> implements $RemoteConfigDetailsEventCopyWith<$Res> {
_$RequestedRemoteConfigDetailsEventCopyWith(_RequestedRemoteConfigDetailsEvent _, $Res Function(_RequestedRemoteConfigDetailsEvent) __);
}
/// @nodoc
class __$RequestedRemoteConfigDetailsEventCopyWithImpl<$Res>
    implements _$RequestedRemoteConfigDetailsEventCopyWith<$Res> {
  __$RequestedRemoteConfigDetailsEventCopyWithImpl(this._self, this._then);

  final _RequestedRemoteConfigDetailsEvent _self;
  final $Res Function(_RequestedRemoteConfigDetailsEvent) _then;




}

/// @nodoc
mixin _$RemoteConfigDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteConfigDetailsState()';
}


}

/// @nodoc
class $RemoteConfigDetailsStateCopyWith<$Res>  {
$RemoteConfigDetailsStateCopyWith(RemoteConfigDetailsState _, $Res Function(RemoteConfigDetailsState) __);
}


/// Adds pattern-matching-related methods to [RemoteConfigDetailsState].
extension RemoteConfigDetailsStatePatterns on RemoteConfigDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialRemoteConfigDetailsState value)?  initial,TResult Function( LoadingRemoteConfigDetailsState value)?  loading,TResult Function( SuccessRemoteConfigDetailsState value)?  success,TResult Function( FailureRemoteConfigDetailsState value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialRemoteConfigDetailsState() when initial != null:
return initial(_that);case LoadingRemoteConfigDetailsState() when loading != null:
return loading(_that);case SuccessRemoteConfigDetailsState() when success != null:
return success(_that);case FailureRemoteConfigDetailsState() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialRemoteConfigDetailsState value)  initial,required TResult Function( LoadingRemoteConfigDetailsState value)  loading,required TResult Function( SuccessRemoteConfigDetailsState value)  success,required TResult Function( FailureRemoteConfigDetailsState value)  failure,}){
final _that = this;
switch (_that) {
case InitialRemoteConfigDetailsState():
return initial(_that);case LoadingRemoteConfigDetailsState():
return loading(_that);case SuccessRemoteConfigDetailsState():
return success(_that);case FailureRemoteConfigDetailsState():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialRemoteConfigDetailsState value)?  initial,TResult? Function( LoadingRemoteConfigDetailsState value)?  loading,TResult? Function( SuccessRemoteConfigDetailsState value)?  success,TResult? Function( FailureRemoteConfigDetailsState value)?  failure,}){
final _that = this;
switch (_that) {
case InitialRemoteConfigDetailsState() when initial != null:
return initial(_that);case LoadingRemoteConfigDetailsState() when loading != null:
return loading(_that);case SuccessRemoteConfigDetailsState() when success != null:
return success(_that);case FailureRemoteConfigDetailsState() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( RemoteMaintenanceConfig maintenance,  RemoteSupportConfig support,  RemoteLimitsConfig limits)?  success,TResult Function( AppException exception)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialRemoteConfigDetailsState() when initial != null:
return initial();case LoadingRemoteConfigDetailsState() when loading != null:
return loading();case SuccessRemoteConfigDetailsState() when success != null:
return success(_that.maintenance,_that.support,_that.limits);case FailureRemoteConfigDetailsState() when failure != null:
return failure(_that.exception);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( RemoteMaintenanceConfig maintenance,  RemoteSupportConfig support,  RemoteLimitsConfig limits)  success,required TResult Function( AppException exception)  failure,}) {final _that = this;
switch (_that) {
case InitialRemoteConfigDetailsState():
return initial();case LoadingRemoteConfigDetailsState():
return loading();case SuccessRemoteConfigDetailsState():
return success(_that.maintenance,_that.support,_that.limits);case FailureRemoteConfigDetailsState():
return failure(_that.exception);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( RemoteMaintenanceConfig maintenance,  RemoteSupportConfig support,  RemoteLimitsConfig limits)?  success,TResult? Function( AppException exception)?  failure,}) {final _that = this;
switch (_that) {
case InitialRemoteConfigDetailsState() when initial != null:
return initial();case LoadingRemoteConfigDetailsState() when loading != null:
return loading();case SuccessRemoteConfigDetailsState() when success != null:
return success(_that.maintenance,_that.support,_that.limits);case FailureRemoteConfigDetailsState() when failure != null:
return failure(_that.exception);case _:
  return null;

}
}

}

/// @nodoc


class InitialRemoteConfigDetailsState implements RemoteConfigDetailsState {
  const InitialRemoteConfigDetailsState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialRemoteConfigDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteConfigDetailsState.initial()';
}


}

/// @nodoc
class $InitialRemoteConfigDetailsStateCopyWith<$Res> implements $RemoteConfigDetailsStateCopyWith<$Res> {
$InitialRemoteConfigDetailsStateCopyWith(InitialRemoteConfigDetailsState _, $Res Function(InitialRemoteConfigDetailsState) __);
}
/// @nodoc
class _$InitialRemoteConfigDetailsStateCopyWithImpl<$Res>
    implements $InitialRemoteConfigDetailsStateCopyWith<$Res> {
  _$InitialRemoteConfigDetailsStateCopyWithImpl(this._self, this._then);

  final InitialRemoteConfigDetailsState _self;
  final $Res Function(InitialRemoteConfigDetailsState) _then;




}

/// @nodoc


class LoadingRemoteConfigDetailsState implements RemoteConfigDetailsState {
  const LoadingRemoteConfigDetailsState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingRemoteConfigDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteConfigDetailsState.loading()';
}


}

/// @nodoc
class $LoadingRemoteConfigDetailsStateCopyWith<$Res> implements $RemoteConfigDetailsStateCopyWith<$Res> {
$LoadingRemoteConfigDetailsStateCopyWith(LoadingRemoteConfigDetailsState _, $Res Function(LoadingRemoteConfigDetailsState) __);
}
/// @nodoc
class _$LoadingRemoteConfigDetailsStateCopyWithImpl<$Res>
    implements $LoadingRemoteConfigDetailsStateCopyWith<$Res> {
  _$LoadingRemoteConfigDetailsStateCopyWithImpl(this._self, this._then);

  final LoadingRemoteConfigDetailsState _self;
  final $Res Function(LoadingRemoteConfigDetailsState) _then;




}

/// @nodoc


class SuccessRemoteConfigDetailsState implements RemoteConfigDetailsState {
  const SuccessRemoteConfigDetailsState({required this.maintenance, required this.support, required this.limits});
  

 final  RemoteMaintenanceConfig maintenance;
 final  RemoteSupportConfig support;
 final  RemoteLimitsConfig limits;

/// Create a copy of RemoteConfigDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessRemoteConfigDetailsStateCopyWith<SuccessRemoteConfigDetailsState> get copyWith => _$SuccessRemoteConfigDetailsStateCopyWithImpl<SuccessRemoteConfigDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessRemoteConfigDetailsState&&(identical(other.maintenance, maintenance) || other.maintenance == maintenance)&&(identical(other.support, support) || other.support == support)&&(identical(other.limits, limits) || other.limits == limits));
}


@override
int get hashCode => Object.hash(runtimeType,maintenance,support,limits);

@override
String toString() {
  return 'RemoteConfigDetailsState.success(maintenance: $maintenance, support: $support, limits: $limits)';
}


}

/// @nodoc
abstract mixin class $SuccessRemoteConfigDetailsStateCopyWith<$Res> implements $RemoteConfigDetailsStateCopyWith<$Res> {
  factory $SuccessRemoteConfigDetailsStateCopyWith(SuccessRemoteConfigDetailsState value, $Res Function(SuccessRemoteConfigDetailsState) _then) = _$SuccessRemoteConfigDetailsStateCopyWithImpl;
@useResult
$Res call({
 RemoteMaintenanceConfig maintenance, RemoteSupportConfig support, RemoteLimitsConfig limits
});


$RemoteMaintenanceConfigCopyWith<$Res> get maintenance;$RemoteSupportConfigCopyWith<$Res> get support;$RemoteLimitsConfigCopyWith<$Res> get limits;

}
/// @nodoc
class _$SuccessRemoteConfigDetailsStateCopyWithImpl<$Res>
    implements $SuccessRemoteConfigDetailsStateCopyWith<$Res> {
  _$SuccessRemoteConfigDetailsStateCopyWithImpl(this._self, this._then);

  final SuccessRemoteConfigDetailsState _self;
  final $Res Function(SuccessRemoteConfigDetailsState) _then;

/// Create a copy of RemoteConfigDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? maintenance = null,Object? support = null,Object? limits = null,}) {
  return _then(SuccessRemoteConfigDetailsState(
maintenance: null == maintenance ? _self.maintenance : maintenance // ignore: cast_nullable_to_non_nullable
as RemoteMaintenanceConfig,support: null == support ? _self.support : support // ignore: cast_nullable_to_non_nullable
as RemoteSupportConfig,limits: null == limits ? _self.limits : limits // ignore: cast_nullable_to_non_nullable
as RemoteLimitsConfig,
  ));
}

/// Create a copy of RemoteConfigDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteMaintenanceConfigCopyWith<$Res> get maintenance {
  
  return $RemoteMaintenanceConfigCopyWith<$Res>(_self.maintenance, (value) {
    return _then(_self.copyWith(maintenance: value));
  });
}/// Create a copy of RemoteConfigDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteSupportConfigCopyWith<$Res> get support {
  
  return $RemoteSupportConfigCopyWith<$Res>(_self.support, (value) {
    return _then(_self.copyWith(support: value));
  });
}/// Create a copy of RemoteConfigDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteLimitsConfigCopyWith<$Res> get limits {
  
  return $RemoteLimitsConfigCopyWith<$Res>(_self.limits, (value) {
    return _then(_self.copyWith(limits: value));
  });
}
}

/// @nodoc


class FailureRemoteConfigDetailsState implements RemoteConfigDetailsState {
  const FailureRemoteConfigDetailsState(this.exception);
  

 final  AppException exception;

/// Create a copy of RemoteConfigDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureRemoteConfigDetailsStateCopyWith<FailureRemoteConfigDetailsState> get copyWith => _$FailureRemoteConfigDetailsStateCopyWithImpl<FailureRemoteConfigDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureRemoteConfigDetailsState&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,exception);

@override
String toString() {
  return 'RemoteConfigDetailsState.failure(exception: $exception)';
}


}

/// @nodoc
abstract mixin class $FailureRemoteConfigDetailsStateCopyWith<$Res> implements $RemoteConfigDetailsStateCopyWith<$Res> {
  factory $FailureRemoteConfigDetailsStateCopyWith(FailureRemoteConfigDetailsState value, $Res Function(FailureRemoteConfigDetailsState) _then) = _$FailureRemoteConfigDetailsStateCopyWithImpl;
@useResult
$Res call({
 AppException exception
});




}
/// @nodoc
class _$FailureRemoteConfigDetailsStateCopyWithImpl<$Res>
    implements $FailureRemoteConfigDetailsStateCopyWith<$Res> {
  _$FailureRemoteConfigDetailsStateCopyWithImpl(this._self, this._then);

  final FailureRemoteConfigDetailsState _self;
  final $Res Function(FailureRemoteConfigDetailsState) _then;

/// Create a copy of RemoteConfigDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exception = null,}) {
  return _then(FailureRemoteConfigDetailsState(
null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}


}

// dart format on
