// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_balance_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransferBalanceEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferBalanceEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransferBalanceEvent()';
}


}

/// @nodoc
class $TransferBalanceEventCopyWith<$Res>  {
$TransferBalanceEventCopyWith(TransferBalanceEvent _, $Res Function(TransferBalanceEvent) __);
}


/// Adds pattern-matching-related methods to [TransferBalanceEvent].
extension TransferBalanceEventPatterns on TransferBalanceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RequestedTransferBalanceEvent value)?  requested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestedTransferBalanceEvent() when requested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RequestedTransferBalanceEvent value)  requested,}){
final _that = this;
switch (_that) {
case _RequestedTransferBalanceEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RequestedTransferBalanceEvent value)?  requested,}){
final _that = this;
switch (_that) {
case _RequestedTransferBalanceEvent() when requested != null:
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
case _RequestedTransferBalanceEvent() when requested != null:
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
case _RequestedTransferBalanceEvent():
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
case _RequestedTransferBalanceEvent() when requested != null:
return requested();case _:
  return null;

}
}

}

/// @nodoc


class _RequestedTransferBalanceEvent implements TransferBalanceEvent {
  const _RequestedTransferBalanceEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestedTransferBalanceEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransferBalanceEvent.requested()';
}


}

/// @nodoc
class _$RequestedTransferBalanceEventCopyWith<$Res> implements $TransferBalanceEventCopyWith<$Res> {
_$RequestedTransferBalanceEventCopyWith(_RequestedTransferBalanceEvent _, $Res Function(_RequestedTransferBalanceEvent) __);
}
/// @nodoc
class __$RequestedTransferBalanceEventCopyWithImpl<$Res>
    implements _$RequestedTransferBalanceEventCopyWith<$Res> {
  __$RequestedTransferBalanceEventCopyWithImpl(this._self, this._then);

  final _RequestedTransferBalanceEvent _self;
  final $Res Function(_RequestedTransferBalanceEvent) _then;




}

/// @nodoc
mixin _$TransferBalanceState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferBalanceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransferBalanceState()';
}


}

/// @nodoc
class $TransferBalanceStateCopyWith<$Res>  {
$TransferBalanceStateCopyWith(TransferBalanceState _, $Res Function(TransferBalanceState) __);
}


/// Adds pattern-matching-related methods to [TransferBalanceState].
extension TransferBalanceStatePatterns on TransferBalanceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialTransferBalanceState value)?  initial,TResult Function( LoadingTransferBalanceState value)?  loading,TResult Function( SuccessTransferBalanceState value)?  success,TResult Function( FailureTransferBalanceState value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialTransferBalanceState() when initial != null:
return initial(_that);case LoadingTransferBalanceState() when loading != null:
return loading(_that);case SuccessTransferBalanceState() when success != null:
return success(_that);case FailureTransferBalanceState() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialTransferBalanceState value)  initial,required TResult Function( LoadingTransferBalanceState value)  loading,required TResult Function( SuccessTransferBalanceState value)  success,required TResult Function( FailureTransferBalanceState value)  failure,}){
final _that = this;
switch (_that) {
case InitialTransferBalanceState():
return initial(_that);case LoadingTransferBalanceState():
return loading(_that);case SuccessTransferBalanceState():
return success(_that);case FailureTransferBalanceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialTransferBalanceState value)?  initial,TResult? Function( LoadingTransferBalanceState value)?  loading,TResult? Function( SuccessTransferBalanceState value)?  success,TResult? Function( FailureTransferBalanceState value)?  failure,}){
final _that = this;
switch (_that) {
case InitialTransferBalanceState() when initial != null:
return initial(_that);case LoadingTransferBalanceState() when loading != null:
return loading(_that);case SuccessTransferBalanceState() when success != null:
return success(_that);case FailureTransferBalanceState() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( int balance)?  success,TResult Function( AppException exception)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialTransferBalanceState() when initial != null:
return initial();case LoadingTransferBalanceState() when loading != null:
return loading();case SuccessTransferBalanceState() when success != null:
return success(_that.balance);case FailureTransferBalanceState() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( int balance)  success,required TResult Function( AppException exception)  failure,}) {final _that = this;
switch (_that) {
case InitialTransferBalanceState():
return initial();case LoadingTransferBalanceState():
return loading();case SuccessTransferBalanceState():
return success(_that.balance);case FailureTransferBalanceState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( int balance)?  success,TResult? Function( AppException exception)?  failure,}) {final _that = this;
switch (_that) {
case InitialTransferBalanceState() when initial != null:
return initial();case LoadingTransferBalanceState() when loading != null:
return loading();case SuccessTransferBalanceState() when success != null:
return success(_that.balance);case FailureTransferBalanceState() when failure != null:
return failure(_that.exception);case _:
  return null;

}
}

}

/// @nodoc


class InitialTransferBalanceState extends TransferBalanceState {
  const InitialTransferBalanceState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialTransferBalanceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransferBalanceState.initial()';
}


}

/// @nodoc
class $InitialTransferBalanceStateCopyWith<$Res> implements $TransferBalanceStateCopyWith<$Res> {
$InitialTransferBalanceStateCopyWith(InitialTransferBalanceState _, $Res Function(InitialTransferBalanceState) __);
}
/// @nodoc
class _$InitialTransferBalanceStateCopyWithImpl<$Res>
    implements $InitialTransferBalanceStateCopyWith<$Res> {
  _$InitialTransferBalanceStateCopyWithImpl(this._self, this._then);

  final InitialTransferBalanceState _self;
  final $Res Function(InitialTransferBalanceState) _then;




}

/// @nodoc


class LoadingTransferBalanceState extends TransferBalanceState {
  const LoadingTransferBalanceState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingTransferBalanceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransferBalanceState.loading()';
}


}

/// @nodoc
class $LoadingTransferBalanceStateCopyWith<$Res> implements $TransferBalanceStateCopyWith<$Res> {
$LoadingTransferBalanceStateCopyWith(LoadingTransferBalanceState _, $Res Function(LoadingTransferBalanceState) __);
}
/// @nodoc
class _$LoadingTransferBalanceStateCopyWithImpl<$Res>
    implements $LoadingTransferBalanceStateCopyWith<$Res> {
  _$LoadingTransferBalanceStateCopyWithImpl(this._self, this._then);

  final LoadingTransferBalanceState _self;
  final $Res Function(LoadingTransferBalanceState) _then;




}

/// @nodoc


class SuccessTransferBalanceState extends TransferBalanceState {
  const SuccessTransferBalanceState(this.balance): super._();
  

 final  int balance;

/// Create a copy of TransferBalanceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessTransferBalanceStateCopyWith<SuccessTransferBalanceState> get copyWith => _$SuccessTransferBalanceStateCopyWithImpl<SuccessTransferBalanceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessTransferBalanceState&&(identical(other.balance, balance) || other.balance == balance));
}


@override
int get hashCode => Object.hash(runtimeType,balance);

@override
String toString() {
  return 'TransferBalanceState.success(balance: $balance)';
}


}

/// @nodoc
abstract mixin class $SuccessTransferBalanceStateCopyWith<$Res> implements $TransferBalanceStateCopyWith<$Res> {
  factory $SuccessTransferBalanceStateCopyWith(SuccessTransferBalanceState value, $Res Function(SuccessTransferBalanceState) _then) = _$SuccessTransferBalanceStateCopyWithImpl;
@useResult
$Res call({
 int balance
});




}
/// @nodoc
class _$SuccessTransferBalanceStateCopyWithImpl<$Res>
    implements $SuccessTransferBalanceStateCopyWith<$Res> {
  _$SuccessTransferBalanceStateCopyWithImpl(this._self, this._then);

  final SuccessTransferBalanceState _self;
  final $Res Function(SuccessTransferBalanceState) _then;

/// Create a copy of TransferBalanceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? balance = null,}) {
  return _then(SuccessTransferBalanceState(
null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class FailureTransferBalanceState extends TransferBalanceState {
  const FailureTransferBalanceState(this.exception): super._();
  

 final  AppException exception;

/// Create a copy of TransferBalanceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureTransferBalanceStateCopyWith<FailureTransferBalanceState> get copyWith => _$FailureTransferBalanceStateCopyWithImpl<FailureTransferBalanceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureTransferBalanceState&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,exception);

@override
String toString() {
  return 'TransferBalanceState.failure(exception: $exception)';
}


}

/// @nodoc
abstract mixin class $FailureTransferBalanceStateCopyWith<$Res> implements $TransferBalanceStateCopyWith<$Res> {
  factory $FailureTransferBalanceStateCopyWith(FailureTransferBalanceState value, $Res Function(FailureTransferBalanceState) _then) = _$FailureTransferBalanceStateCopyWithImpl;
@useResult
$Res call({
 AppException exception
});




}
/// @nodoc
class _$FailureTransferBalanceStateCopyWithImpl<$Res>
    implements $FailureTransferBalanceStateCopyWith<$Res> {
  _$FailureTransferBalanceStateCopyWithImpl(this._self, this._then);

  final FailureTransferBalanceState _self;
  final $Res Function(FailureTransferBalanceState) _then;

/// Create a copy of TransferBalanceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exception = null,}) {
  return _then(FailureTransferBalanceState(
null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}


}

// dart format on
