// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductListEvent()';
}


}

/// @nodoc
class $ProductListEventCopyWith<$Res>  {
$ProductListEventCopyWith(ProductListEvent _, $Res Function(ProductListEvent) __);
}


/// Adds pattern-matching-related methods to [ProductListEvent].
extension ProductListEventPatterns on ProductListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RequestedProductListEvent value)?  requested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestedProductListEvent() when requested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RequestedProductListEvent value)  requested,}){
final _that = this;
switch (_that) {
case _RequestedProductListEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RequestedProductListEvent value)?  requested,}){
final _that = this;
switch (_that) {
case _RequestedProductListEvent() when requested != null:
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
case _RequestedProductListEvent() when requested != null:
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
case _RequestedProductListEvent():
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
case _RequestedProductListEvent() when requested != null:
return requested();case _:
  return null;

}
}

}

/// @nodoc


class _RequestedProductListEvent implements ProductListEvent {
  const _RequestedProductListEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestedProductListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductListEvent.requested()';
}


}

/// @nodoc
class _$RequestedProductListEventCopyWith<$Res> implements $ProductListEventCopyWith<$Res> {
_$RequestedProductListEventCopyWith(_RequestedProductListEvent _, $Res Function(_RequestedProductListEvent) __);
}
/// @nodoc
class __$RequestedProductListEventCopyWithImpl<$Res>
    implements _$RequestedProductListEventCopyWith<$Res> {
  __$RequestedProductListEventCopyWithImpl(this._self, this._then);

  final _RequestedProductListEvent _self;
  final $Res Function(_RequestedProductListEvent) _then;




}

/// @nodoc
mixin _$ProductListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductListState()';
}


}

/// @nodoc
class $ProductListStateCopyWith<$Res>  {
$ProductListStateCopyWith(ProductListState _, $Res Function(ProductListState) __);
}


/// Adds pattern-matching-related methods to [ProductListState].
extension ProductListStatePatterns on ProductListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialProductListState value)?  initial,TResult Function( LoadingProductListState value)?  loading,TResult Function( SuccessProductListState value)?  success,TResult Function( FailureProductListState value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialProductListState() when initial != null:
return initial(_that);case LoadingProductListState() when loading != null:
return loading(_that);case SuccessProductListState() when success != null:
return success(_that);case FailureProductListState() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialProductListState value)  initial,required TResult Function( LoadingProductListState value)  loading,required TResult Function( SuccessProductListState value)  success,required TResult Function( FailureProductListState value)  failure,}){
final _that = this;
switch (_that) {
case InitialProductListState():
return initial(_that);case LoadingProductListState():
return loading(_that);case SuccessProductListState():
return success(_that);case FailureProductListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialProductListState value)?  initial,TResult? Function( LoadingProductListState value)?  loading,TResult? Function( SuccessProductListState value)?  success,TResult? Function( FailureProductListState value)?  failure,}){
final _that = this;
switch (_that) {
case InitialProductListState() when initial != null:
return initial(_that);case LoadingProductListState() when loading != null:
return loading(_that);case SuccessProductListState() when success != null:
return success(_that);case FailureProductListState() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Product> products)?  success,TResult Function( AppException exception)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialProductListState() when initial != null:
return initial();case LoadingProductListState() when loading != null:
return loading();case SuccessProductListState() when success != null:
return success(_that.products);case FailureProductListState() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Product> products)  success,required TResult Function( AppException exception)  failure,}) {final _that = this;
switch (_that) {
case InitialProductListState():
return initial();case LoadingProductListState():
return loading();case SuccessProductListState():
return success(_that.products);case FailureProductListState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Product> products)?  success,TResult? Function( AppException exception)?  failure,}) {final _that = this;
switch (_that) {
case InitialProductListState() when initial != null:
return initial();case LoadingProductListState() when loading != null:
return loading();case SuccessProductListState() when success != null:
return success(_that.products);case FailureProductListState() when failure != null:
return failure(_that.exception);case _:
  return null;

}
}

}

/// @nodoc


class InitialProductListState extends ProductListState {
  const InitialProductListState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialProductListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductListState.initial()';
}


}

/// @nodoc
class $InitialProductListStateCopyWith<$Res> implements $ProductListStateCopyWith<$Res> {
$InitialProductListStateCopyWith(InitialProductListState _, $Res Function(InitialProductListState) __);
}
/// @nodoc
class _$InitialProductListStateCopyWithImpl<$Res>
    implements $InitialProductListStateCopyWith<$Res> {
  _$InitialProductListStateCopyWithImpl(this._self, this._then);

  final InitialProductListState _self;
  final $Res Function(InitialProductListState) _then;




}

/// @nodoc


class LoadingProductListState extends ProductListState {
  const LoadingProductListState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingProductListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductListState.loading()';
}


}

/// @nodoc
class $LoadingProductListStateCopyWith<$Res> implements $ProductListStateCopyWith<$Res> {
$LoadingProductListStateCopyWith(LoadingProductListState _, $Res Function(LoadingProductListState) __);
}
/// @nodoc
class _$LoadingProductListStateCopyWithImpl<$Res>
    implements $LoadingProductListStateCopyWith<$Res> {
  _$LoadingProductListStateCopyWithImpl(this._self, this._then);

  final LoadingProductListState _self;
  final $Res Function(LoadingProductListState) _then;




}

/// @nodoc


class SuccessProductListState extends ProductListState {
  const SuccessProductListState(this.products): super._();
  

 final  List<Product> products;

/// Create a copy of ProductListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessProductListStateCopyWith<SuccessProductListState> get copyWith => _$SuccessProductListStateCopyWithImpl<SuccessProductListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessProductListState&&const DeepCollectionEquality().equals(other.products, products));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'ProductListState.success(products: $products)';
}


}

/// @nodoc
abstract mixin class $SuccessProductListStateCopyWith<$Res> implements $ProductListStateCopyWith<$Res> {
  factory $SuccessProductListStateCopyWith(SuccessProductListState value, $Res Function(SuccessProductListState) _then) = _$SuccessProductListStateCopyWithImpl;
@useResult
$Res call({
 List<Product> products
});




}
/// @nodoc
class _$SuccessProductListStateCopyWithImpl<$Res>
    implements $SuccessProductListStateCopyWith<$Res> {
  _$SuccessProductListStateCopyWithImpl(this._self, this._then);

  final SuccessProductListState _self;
  final $Res Function(SuccessProductListState) _then;

/// Create a copy of ProductListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(SuccessProductListState(
null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,
  ));
}


}

/// @nodoc


class FailureProductListState extends ProductListState {
  const FailureProductListState(this.exception): super._();
  

 final  AppException exception;

/// Create a copy of ProductListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureProductListStateCopyWith<FailureProductListState> get copyWith => _$FailureProductListStateCopyWithImpl<FailureProductListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureProductListState&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,exception);

@override
String toString() {
  return 'ProductListState.failure(exception: $exception)';
}


}

/// @nodoc
abstract mixin class $FailureProductListStateCopyWith<$Res> implements $ProductListStateCopyWith<$Res> {
  factory $FailureProductListStateCopyWith(FailureProductListState value, $Res Function(FailureProductListState) _then) = _$FailureProductListStateCopyWithImpl;
@useResult
$Res call({
 AppException exception
});




}
/// @nodoc
class _$FailureProductListStateCopyWithImpl<$Res>
    implements $FailureProductListStateCopyWith<$Res> {
  _$FailureProductListStateCopyWithImpl(this._self, this._then);

  final FailureProductListState _self;
  final $Res Function(FailureProductListState) _then;

/// Create a copy of ProductListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exception = null,}) {
  return _then(FailureProductListState(
null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}


}

// dart format on
