// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RateDetailsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RateDetailsEvent()';
}


}

/// @nodoc
class $RateDetailsEventCopyWith<$Res>  {
$RateDetailsEventCopyWith(RateDetailsEvent _, $Res Function(RateDetailsEvent) __);
}


/// Adds pattern-matching-related methods to [RateDetailsEvent].
extension RateDetailsEventPatterns on RateDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RequestedRateDetailsEvent value)?  requested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestedRateDetailsEvent() when requested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RequestedRateDetailsEvent value)  requested,}){
final _that = this;
switch (_that) {
case _RequestedRateDetailsEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RequestedRateDetailsEvent value)?  requested,}){
final _that = this;
switch (_that) {
case _RequestedRateDetailsEvent() when requested != null:
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
case _RequestedRateDetailsEvent() when requested != null:
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
case _RequestedRateDetailsEvent():
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
case _RequestedRateDetailsEvent() when requested != null:
return requested();case _:
  return null;

}
}

}

/// @nodoc


class _RequestedRateDetailsEvent implements RateDetailsEvent {
  const _RequestedRateDetailsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestedRateDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RateDetailsEvent.requested()';
}


}

/// @nodoc
class _$RequestedRateDetailsEventCopyWith<$Res> implements $RateDetailsEventCopyWith<$Res> {
_$RequestedRateDetailsEventCopyWith(_RequestedRateDetailsEvent _, $Res Function(_RequestedRateDetailsEvent) __);
}
/// @nodoc
class __$RequestedRateDetailsEventCopyWithImpl<$Res>
    implements _$RequestedRateDetailsEventCopyWith<$Res> {
  __$RequestedRateDetailsEventCopyWithImpl(this._self, this._then);

  final _RequestedRateDetailsEvent _self;
  final $Res Function(_RequestedRateDetailsEvent) _then;




}

/// @nodoc
mixin _$RateDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RateDetailsState()';
}


}

/// @nodoc
class $RateDetailsStateCopyWith<$Res>  {
$RateDetailsStateCopyWith(RateDetailsState _, $Res Function(RateDetailsState) __);
}


/// Adds pattern-matching-related methods to [RateDetailsState].
extension RateDetailsStatePatterns on RateDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialRateDetailsState value)?  initial,TResult Function( LoadingRateDetailsState value)?  loading,TResult Function( SuccessRateDetailsState value)?  success,TResult Function( FailureRateDetailsState value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialRateDetailsState() when initial != null:
return initial(_that);case LoadingRateDetailsState() when loading != null:
return loading(_that);case SuccessRateDetailsState() when success != null:
return success(_that);case FailureRateDetailsState() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialRateDetailsState value)  initial,required TResult Function( LoadingRateDetailsState value)  loading,required TResult Function( SuccessRateDetailsState value)  success,required TResult Function( FailureRateDetailsState value)  failure,}){
final _that = this;
switch (_that) {
case InitialRateDetailsState():
return initial(_that);case LoadingRateDetailsState():
return loading(_that);case SuccessRateDetailsState():
return success(_that);case FailureRateDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialRateDetailsState value)?  initial,TResult? Function( LoadingRateDetailsState value)?  loading,TResult? Function( SuccessRateDetailsState value)?  success,TResult? Function( FailureRateDetailsState value)?  failure,}){
final _that = this;
switch (_that) {
case InitialRateDetailsState() when initial != null:
return initial(_that);case LoadingRateDetailsState() when loading != null:
return loading(_that);case SuccessRateDetailsState() when success != null:
return success(_that);case FailureRateDetailsState() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( double rate,  List<String> calls)?  success,TResult Function( AppException exception,  List<String> calls)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialRateDetailsState() when initial != null:
return initial();case LoadingRateDetailsState() when loading != null:
return loading();case SuccessRateDetailsState() when success != null:
return success(_that.rate,_that.calls);case FailureRateDetailsState() when failure != null:
return failure(_that.exception,_that.calls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( double rate,  List<String> calls)  success,required TResult Function( AppException exception,  List<String> calls)  failure,}) {final _that = this;
switch (_that) {
case InitialRateDetailsState():
return initial();case LoadingRateDetailsState():
return loading();case SuccessRateDetailsState():
return success(_that.rate,_that.calls);case FailureRateDetailsState():
return failure(_that.exception,_that.calls);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( double rate,  List<String> calls)?  success,TResult? Function( AppException exception,  List<String> calls)?  failure,}) {final _that = this;
switch (_that) {
case InitialRateDetailsState() when initial != null:
return initial();case LoadingRateDetailsState() when loading != null:
return loading();case SuccessRateDetailsState() when success != null:
return success(_that.rate,_that.calls);case FailureRateDetailsState() when failure != null:
return failure(_that.exception,_that.calls);case _:
  return null;

}
}

}

/// @nodoc


class InitialRateDetailsState extends RateDetailsState {
  const InitialRateDetailsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialRateDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RateDetailsState.initial()';
}


}

/// @nodoc
class $InitialRateDetailsStateCopyWith<$Res> implements $RateDetailsStateCopyWith<$Res> {
$InitialRateDetailsStateCopyWith(InitialRateDetailsState _, $Res Function(InitialRateDetailsState) __);
}
/// @nodoc
class _$InitialRateDetailsStateCopyWithImpl<$Res>
    implements $InitialRateDetailsStateCopyWith<$Res> {
  _$InitialRateDetailsStateCopyWithImpl(this._self, this._then);

  final InitialRateDetailsState _self;
  final $Res Function(InitialRateDetailsState) _then;




}

/// @nodoc


class LoadingRateDetailsState extends RateDetailsState {
  const LoadingRateDetailsState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingRateDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RateDetailsState.loading()';
}


}

/// @nodoc
class $LoadingRateDetailsStateCopyWith<$Res> implements $RateDetailsStateCopyWith<$Res> {
$LoadingRateDetailsStateCopyWith(LoadingRateDetailsState _, $Res Function(LoadingRateDetailsState) __);
}
/// @nodoc
class _$LoadingRateDetailsStateCopyWithImpl<$Res>
    implements $LoadingRateDetailsStateCopyWith<$Res> {
  _$LoadingRateDetailsStateCopyWithImpl(this._self, this._then);

  final LoadingRateDetailsState _self;
  final $Res Function(LoadingRateDetailsState) _then;




}

/// @nodoc


class SuccessRateDetailsState extends RateDetailsState {
  const SuccessRateDetailsState(this.rate, this.calls): super._();
  

 final  double rate;
 final  List<String> calls;

/// Create a copy of RateDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessRateDetailsStateCopyWith<SuccessRateDetailsState> get copyWith => _$SuccessRateDetailsStateCopyWithImpl<SuccessRateDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessRateDetailsState&&(identical(other.rate, rate) || other.rate == rate)&&const DeepCollectionEquality().equals(other.calls, calls));
}


@override
int get hashCode => Object.hash(runtimeType,rate,const DeepCollectionEquality().hash(calls));

@override
String toString() {
  return 'RateDetailsState.success(rate: $rate, calls: $calls)';
}


}

/// @nodoc
abstract mixin class $SuccessRateDetailsStateCopyWith<$Res> implements $RateDetailsStateCopyWith<$Res> {
  factory $SuccessRateDetailsStateCopyWith(SuccessRateDetailsState value, $Res Function(SuccessRateDetailsState) _then) = _$SuccessRateDetailsStateCopyWithImpl;
@useResult
$Res call({
 double rate, List<String> calls
});




}
/// @nodoc
class _$SuccessRateDetailsStateCopyWithImpl<$Res>
    implements $SuccessRateDetailsStateCopyWith<$Res> {
  _$SuccessRateDetailsStateCopyWithImpl(this._self, this._then);

  final SuccessRateDetailsState _self;
  final $Res Function(SuccessRateDetailsState) _then;

/// Create a copy of RateDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rate = null,Object? calls = null,}) {
  return _then(SuccessRateDetailsState(
null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,null == calls ? _self.calls : calls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class FailureRateDetailsState extends RateDetailsState {
  const FailureRateDetailsState(this.exception, this.calls): super._();
  

 final  AppException exception;
 final  List<String> calls;

/// Create a copy of RateDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureRateDetailsStateCopyWith<FailureRateDetailsState> get copyWith => _$FailureRateDetailsStateCopyWithImpl<FailureRateDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureRateDetailsState&&(identical(other.exception, exception) || other.exception == exception)&&const DeepCollectionEquality().equals(other.calls, calls));
}


@override
int get hashCode => Object.hash(runtimeType,exception,const DeepCollectionEquality().hash(calls));

@override
String toString() {
  return 'RateDetailsState.failure(exception: $exception, calls: $calls)';
}


}

/// @nodoc
abstract mixin class $FailureRateDetailsStateCopyWith<$Res> implements $RateDetailsStateCopyWith<$Res> {
  factory $FailureRateDetailsStateCopyWith(FailureRateDetailsState value, $Res Function(FailureRateDetailsState) _then) = _$FailureRateDetailsStateCopyWithImpl;
@useResult
$Res call({
 AppException exception, List<String> calls
});




}
/// @nodoc
class _$FailureRateDetailsStateCopyWithImpl<$Res>
    implements $FailureRateDetailsStateCopyWith<$Res> {
  _$FailureRateDetailsStateCopyWithImpl(this._self, this._then);

  final FailureRateDetailsState _self;
  final $Res Function(FailureRateDetailsState) _then;

/// Create a copy of RateDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exception = null,Object? calls = null,}) {
  return _then(FailureRateDetailsState(
null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as AppException,null == calls ? _self.calls : calls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
