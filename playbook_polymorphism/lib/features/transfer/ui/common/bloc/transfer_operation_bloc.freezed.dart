// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_operation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransferOperationEvent {

 int get amount;
/// Create a copy of TransferOperationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferOperationEventCopyWith<TransferOperationEvent> get copyWith => _$TransferOperationEventCopyWithImpl<TransferOperationEvent>(this as TransferOperationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferOperationEvent&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'TransferOperationEvent(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $TransferOperationEventCopyWith<$Res>  {
  factory $TransferOperationEventCopyWith(TransferOperationEvent value, $Res Function(TransferOperationEvent) _then) = _$TransferOperationEventCopyWithImpl;
@useResult
$Res call({
 int amount
});




}
/// @nodoc
class _$TransferOperationEventCopyWithImpl<$Res>
    implements $TransferOperationEventCopyWith<$Res> {
  _$TransferOperationEventCopyWithImpl(this._self, this._then);

  final TransferOperationEvent _self;
  final $Res Function(TransferOperationEvent) _then;

/// Create a copy of TransferOperationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferOperationEvent].
extension TransferOperationEventPatterns on TransferOperationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SubmittedTransferOperationEvent value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmittedTransferOperationEvent() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SubmittedTransferOperationEvent value)  submitted,}){
final _that = this;
switch (_that) {
case _SubmittedTransferOperationEvent():
return submitted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SubmittedTransferOperationEvent value)?  submitted,}){
final _that = this;
switch (_that) {
case _SubmittedTransferOperationEvent() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int amount)?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmittedTransferOperationEvent() when submitted != null:
return submitted(_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int amount)  submitted,}) {final _that = this;
switch (_that) {
case _SubmittedTransferOperationEvent():
return submitted(_that.amount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int amount)?  submitted,}) {final _that = this;
switch (_that) {
case _SubmittedTransferOperationEvent() when submitted != null:
return submitted(_that.amount);case _:
  return null;

}
}

}

/// @nodoc


class _SubmittedTransferOperationEvent implements TransferOperationEvent {
  const _SubmittedTransferOperationEvent(this.amount);
  

@override final  int amount;

/// Create a copy of TransferOperationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmittedTransferOperationEventCopyWith<_SubmittedTransferOperationEvent> get copyWith => __$SubmittedTransferOperationEventCopyWithImpl<_SubmittedTransferOperationEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmittedTransferOperationEvent&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'TransferOperationEvent.submitted(amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$SubmittedTransferOperationEventCopyWith<$Res> implements $TransferOperationEventCopyWith<$Res> {
  factory _$SubmittedTransferOperationEventCopyWith(_SubmittedTransferOperationEvent value, $Res Function(_SubmittedTransferOperationEvent) _then) = __$SubmittedTransferOperationEventCopyWithImpl;
@override @useResult
$Res call({
 int amount
});




}
/// @nodoc
class __$SubmittedTransferOperationEventCopyWithImpl<$Res>
    implements _$SubmittedTransferOperationEventCopyWith<$Res> {
  __$SubmittedTransferOperationEventCopyWithImpl(this._self, this._then);

  final _SubmittedTransferOperationEvent _self;
  final $Res Function(_SubmittedTransferOperationEvent) _then;

/// Create a copy of TransferOperationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(_SubmittedTransferOperationEvent(
null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$TransferOperationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferOperationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransferOperationState()';
}


}

/// @nodoc
class $TransferOperationStateCopyWith<$Res>  {
$TransferOperationStateCopyWith(TransferOperationState _, $Res Function(TransferOperationState) __);
}


/// Adds pattern-matching-related methods to [TransferOperationState].
extension TransferOperationStatePatterns on TransferOperationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialTransferOperationState value)?  initial,TResult Function( SubmittingTransferOperationState value)?  submitting,TResult Function( SuccessTransferOperationState value)?  success,TResult Function( FailureTransferOperationState value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialTransferOperationState() when initial != null:
return initial(_that);case SubmittingTransferOperationState() when submitting != null:
return submitting(_that);case SuccessTransferOperationState() when success != null:
return success(_that);case FailureTransferOperationState() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialTransferOperationState value)  initial,required TResult Function( SubmittingTransferOperationState value)  submitting,required TResult Function( SuccessTransferOperationState value)  success,required TResult Function( FailureTransferOperationState value)  failure,}){
final _that = this;
switch (_that) {
case InitialTransferOperationState():
return initial(_that);case SubmittingTransferOperationState():
return submitting(_that);case SuccessTransferOperationState():
return success(_that);case FailureTransferOperationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialTransferOperationState value)?  initial,TResult? Function( SubmittingTransferOperationState value)?  submitting,TResult? Function( SuccessTransferOperationState value)?  success,TResult? Function( FailureTransferOperationState value)?  failure,}){
final _that = this;
switch (_that) {
case InitialTransferOperationState() when initial != null:
return initial(_that);case SubmittingTransferOperationState() when submitting != null:
return submitting(_that);case SuccessTransferOperationState() when success != null:
return success(_that);case FailureTransferOperationState() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  submitting,TResult Function( int amount)?  success,TResult Function( AppException exception)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialTransferOperationState() when initial != null:
return initial();case SubmittingTransferOperationState() when submitting != null:
return submitting();case SuccessTransferOperationState() when success != null:
return success(_that.amount);case FailureTransferOperationState() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  submitting,required TResult Function( int amount)  success,required TResult Function( AppException exception)  failure,}) {final _that = this;
switch (_that) {
case InitialTransferOperationState():
return initial();case SubmittingTransferOperationState():
return submitting();case SuccessTransferOperationState():
return success(_that.amount);case FailureTransferOperationState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  submitting,TResult? Function( int amount)?  success,TResult? Function( AppException exception)?  failure,}) {final _that = this;
switch (_that) {
case InitialTransferOperationState() when initial != null:
return initial();case SubmittingTransferOperationState() when submitting != null:
return submitting();case SuccessTransferOperationState() when success != null:
return success(_that.amount);case FailureTransferOperationState() when failure != null:
return failure(_that.exception);case _:
  return null;

}
}

}

/// @nodoc


class InitialTransferOperationState extends TransferOperationState {
  const InitialTransferOperationState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialTransferOperationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransferOperationState.initial()';
}


}

/// @nodoc
class $InitialTransferOperationStateCopyWith<$Res> implements $TransferOperationStateCopyWith<$Res> {
$InitialTransferOperationStateCopyWith(InitialTransferOperationState _, $Res Function(InitialTransferOperationState) __);
}
/// @nodoc
class _$InitialTransferOperationStateCopyWithImpl<$Res>
    implements $InitialTransferOperationStateCopyWith<$Res> {
  _$InitialTransferOperationStateCopyWithImpl(this._self, this._then);

  final InitialTransferOperationState _self;
  final $Res Function(InitialTransferOperationState) _then;




}

/// @nodoc


class SubmittingTransferOperationState extends TransferOperationState {
  const SubmittingTransferOperationState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmittingTransferOperationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransferOperationState.submitting()';
}


}

/// @nodoc
class $SubmittingTransferOperationStateCopyWith<$Res> implements $TransferOperationStateCopyWith<$Res> {
$SubmittingTransferOperationStateCopyWith(SubmittingTransferOperationState _, $Res Function(SubmittingTransferOperationState) __);
}
/// @nodoc
class _$SubmittingTransferOperationStateCopyWithImpl<$Res>
    implements $SubmittingTransferOperationStateCopyWith<$Res> {
  _$SubmittingTransferOperationStateCopyWithImpl(this._self, this._then);

  final SubmittingTransferOperationState _self;
  final $Res Function(SubmittingTransferOperationState) _then;




}

/// @nodoc


class SuccessTransferOperationState extends TransferOperationState {
  const SuccessTransferOperationState(this.amount): super._();
  

 final  int amount;

/// Create a copy of TransferOperationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessTransferOperationStateCopyWith<SuccessTransferOperationState> get copyWith => _$SuccessTransferOperationStateCopyWithImpl<SuccessTransferOperationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessTransferOperationState&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'TransferOperationState.success(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $SuccessTransferOperationStateCopyWith<$Res> implements $TransferOperationStateCopyWith<$Res> {
  factory $SuccessTransferOperationStateCopyWith(SuccessTransferOperationState value, $Res Function(SuccessTransferOperationState) _then) = _$SuccessTransferOperationStateCopyWithImpl;
@useResult
$Res call({
 int amount
});




}
/// @nodoc
class _$SuccessTransferOperationStateCopyWithImpl<$Res>
    implements $SuccessTransferOperationStateCopyWith<$Res> {
  _$SuccessTransferOperationStateCopyWithImpl(this._self, this._then);

  final SuccessTransferOperationState _self;
  final $Res Function(SuccessTransferOperationState) _then;

/// Create a copy of TransferOperationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(SuccessTransferOperationState(
null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class FailureTransferOperationState extends TransferOperationState {
  const FailureTransferOperationState(this.exception): super._();
  

 final  AppException exception;

/// Create a copy of TransferOperationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureTransferOperationStateCopyWith<FailureTransferOperationState> get copyWith => _$FailureTransferOperationStateCopyWithImpl<FailureTransferOperationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureTransferOperationState&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,exception);

@override
String toString() {
  return 'TransferOperationState.failure(exception: $exception)';
}


}

/// @nodoc
abstract mixin class $FailureTransferOperationStateCopyWith<$Res> implements $TransferOperationStateCopyWith<$Res> {
  factory $FailureTransferOperationStateCopyWith(FailureTransferOperationState value, $Res Function(FailureTransferOperationState) _then) = _$FailureTransferOperationStateCopyWithImpl;
@useResult
$Res call({
 AppException exception
});




}
/// @nodoc
class _$FailureTransferOperationStateCopyWithImpl<$Res>
    implements $FailureTransferOperationStateCopyWith<$Res> {
  _$FailureTransferOperationStateCopyWithImpl(this._self, this._then);

  final FailureTransferOperationState _self;
  final $Res Function(FailureTransferOperationState) _then;

/// Create a copy of TransferOperationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exception = null,}) {
  return _then(FailureTransferOperationState(
null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}


}

// dart format on
