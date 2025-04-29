// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartItem item) addProduct,
    required TResult Function(Product product) removeProduct,
    required TResult Function() clearCart,
    required TResult Function() getCartItems,
    required TResult Function(Product product, int quantity) updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CartItem item)? addProduct,
    TResult? Function(Product product)? removeProduct,
    TResult? Function()? clearCart,
    TResult? Function()? getCartItems,
    TResult? Function(Product product, int quantity)? updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartItem item)? addProduct,
    TResult Function(Product product)? removeProduct,
    TResult Function()? clearCart,
    TResult Function()? getCartItems,
    TResult Function(Product product, int quantity)? updateQuantity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_RemoveProduct value) removeProduct,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_GetCartItems value) getCartItems,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_RemoveProduct value)? removeProduct,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_GetCartItems value)? getCartItems,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_RemoveProduct value)? removeProduct,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_GetCartItems value)? getCartItems,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddProductImplCopyWith<$Res> {
  factory _$$AddProductImplCopyWith(
          _$AddProductImpl value, $Res Function(_$AddProductImpl) then) =
      __$$AddProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartItem item});

  $CartItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$AddProductImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$AddProductImpl>
    implements _$$AddProductImplCopyWith<$Res> {
  __$$AddProductImplCopyWithImpl(
      _$AddProductImpl _value, $Res Function(_$AddProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$AddProductImpl(
      null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CartItem,
    ));
  }

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartItemCopyWith<$Res> get item {
    return $CartItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$AddProductImpl implements _AddProduct {
  const _$AddProductImpl(this.item);

  @override
  final CartItem item;

  @override
  String toString() {
    return 'CartEvent.addProduct(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      __$$AddProductImplCopyWithImpl<_$AddProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartItem item) addProduct,
    required TResult Function(Product product) removeProduct,
    required TResult Function() clearCart,
    required TResult Function() getCartItems,
    required TResult Function(Product product, int quantity) updateQuantity,
  }) {
    return addProduct(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CartItem item)? addProduct,
    TResult? Function(Product product)? removeProduct,
    TResult? Function()? clearCart,
    TResult? Function()? getCartItems,
    TResult? Function(Product product, int quantity)? updateQuantity,
  }) {
    return addProduct?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartItem item)? addProduct,
    TResult Function(Product product)? removeProduct,
    TResult Function()? clearCart,
    TResult Function()? getCartItems,
    TResult Function(Product product, int quantity)? updateQuantity,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_RemoveProduct value) removeProduct,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_GetCartItems value) getCartItems,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) {
    return addProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_RemoveProduct value)? removeProduct,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_GetCartItems value)? getCartItems,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) {
    return addProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_RemoveProduct value)? removeProduct,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_GetCartItems value)? getCartItems,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(this);
    }
    return orElse();
  }
}

abstract class _AddProduct implements CartEvent {
  const factory _AddProduct(final CartItem item) = _$AddProductImpl;

  CartItem get item;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveProductImplCopyWith<$Res> {
  factory _$$RemoveProductImplCopyWith(
          _$RemoveProductImpl value, $Res Function(_$RemoveProductImpl) then) =
      __$$RemoveProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$RemoveProductImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$RemoveProductImpl>
    implements _$$RemoveProductImplCopyWith<$Res> {
  __$$RemoveProductImplCopyWithImpl(
      _$RemoveProductImpl _value, $Res Function(_$RemoveProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$RemoveProductImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$RemoveProductImpl implements _RemoveProduct {
  const _$RemoveProductImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'CartEvent.removeProduct(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveProductImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveProductImplCopyWith<_$RemoveProductImpl> get copyWith =>
      __$$RemoveProductImplCopyWithImpl<_$RemoveProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartItem item) addProduct,
    required TResult Function(Product product) removeProduct,
    required TResult Function() clearCart,
    required TResult Function() getCartItems,
    required TResult Function(Product product, int quantity) updateQuantity,
  }) {
    return removeProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CartItem item)? addProduct,
    TResult? Function(Product product)? removeProduct,
    TResult? Function()? clearCart,
    TResult? Function()? getCartItems,
    TResult? Function(Product product, int quantity)? updateQuantity,
  }) {
    return removeProduct?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartItem item)? addProduct,
    TResult Function(Product product)? removeProduct,
    TResult Function()? clearCart,
    TResult Function()? getCartItems,
    TResult Function(Product product, int quantity)? updateQuantity,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_RemoveProduct value) removeProduct,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_GetCartItems value) getCartItems,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) {
    return removeProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_RemoveProduct value)? removeProduct,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_GetCartItems value)? getCartItems,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) {
    return removeProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_RemoveProduct value)? removeProduct,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_GetCartItems value)? getCartItems,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(this);
    }
    return orElse();
  }
}

abstract class _RemoveProduct implements CartEvent {
  const factory _RemoveProduct(final Product product) = _$RemoveProductImpl;

  Product get product;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveProductImplCopyWith<_$RemoveProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearCartImplCopyWith<$Res> {
  factory _$$ClearCartImplCopyWith(
          _$ClearCartImpl value, $Res Function(_$ClearCartImpl) then) =
      __$$ClearCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ClearCartImpl>
    implements _$$ClearCartImplCopyWith<$Res> {
  __$$ClearCartImplCopyWithImpl(
      _$ClearCartImpl _value, $Res Function(_$ClearCartImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearCartImpl implements _ClearCart {
  const _$ClearCartImpl();

  @override
  String toString() {
    return 'CartEvent.clearCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartItem item) addProduct,
    required TResult Function(Product product) removeProduct,
    required TResult Function() clearCart,
    required TResult Function() getCartItems,
    required TResult Function(Product product, int quantity) updateQuantity,
  }) {
    return clearCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CartItem item)? addProduct,
    TResult? Function(Product product)? removeProduct,
    TResult? Function()? clearCart,
    TResult? Function()? getCartItems,
    TResult? Function(Product product, int quantity)? updateQuantity,
  }) {
    return clearCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartItem item)? addProduct,
    TResult Function(Product product)? removeProduct,
    TResult Function()? clearCart,
    TResult Function()? getCartItems,
    TResult Function(Product product, int quantity)? updateQuantity,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_RemoveProduct value) removeProduct,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_GetCartItems value) getCartItems,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) {
    return clearCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_RemoveProduct value)? removeProduct,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_GetCartItems value)? getCartItems,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) {
    return clearCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_RemoveProduct value)? removeProduct,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_GetCartItems value)? getCartItems,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart(this);
    }
    return orElse();
  }
}

abstract class _ClearCart implements CartEvent {
  const factory _ClearCart() = _$ClearCartImpl;
}

/// @nodoc
abstract class _$$GetCartItemsImplCopyWith<$Res> {
  factory _$$GetCartItemsImplCopyWith(
          _$GetCartItemsImpl value, $Res Function(_$GetCartItemsImpl) then) =
      __$$GetCartItemsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCartItemsImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$GetCartItemsImpl>
    implements _$$GetCartItemsImplCopyWith<$Res> {
  __$$GetCartItemsImplCopyWithImpl(
      _$GetCartItemsImpl _value, $Res Function(_$GetCartItemsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetCartItemsImpl implements _GetCartItems {
  const _$GetCartItemsImpl();

  @override
  String toString() {
    return 'CartEvent.getCartItems()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCartItemsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartItem item) addProduct,
    required TResult Function(Product product) removeProduct,
    required TResult Function() clearCart,
    required TResult Function() getCartItems,
    required TResult Function(Product product, int quantity) updateQuantity,
  }) {
    return getCartItems();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CartItem item)? addProduct,
    TResult? Function(Product product)? removeProduct,
    TResult? Function()? clearCart,
    TResult? Function()? getCartItems,
    TResult? Function(Product product, int quantity)? updateQuantity,
  }) {
    return getCartItems?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartItem item)? addProduct,
    TResult Function(Product product)? removeProduct,
    TResult Function()? clearCart,
    TResult Function()? getCartItems,
    TResult Function(Product product, int quantity)? updateQuantity,
    required TResult orElse(),
  }) {
    if (getCartItems != null) {
      return getCartItems();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_RemoveProduct value) removeProduct,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_GetCartItems value) getCartItems,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) {
    return getCartItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_RemoveProduct value)? removeProduct,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_GetCartItems value)? getCartItems,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) {
    return getCartItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_RemoveProduct value)? removeProduct,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_GetCartItems value)? getCartItems,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) {
    if (getCartItems != null) {
      return getCartItems(this);
    }
    return orElse();
  }
}

abstract class _GetCartItems implements CartEvent {
  const factory _GetCartItems() = _$GetCartItemsImpl;
}

/// @nodoc
abstract class _$$UpdateQuantityImplCopyWith<$Res> {
  factory _$$UpdateQuantityImplCopyWith(_$UpdateQuantityImpl value,
          $Res Function(_$UpdateQuantityImpl) then) =
      __$$UpdateQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product, int quantity});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$UpdateQuantityImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpdateQuantityImpl>
    implements _$$UpdateQuantityImplCopyWith<$Res> {
  __$$UpdateQuantityImplCopyWithImpl(
      _$UpdateQuantityImpl _value, $Res Function(_$UpdateQuantityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_$UpdateQuantityImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$UpdateQuantityImpl implements _UpdateQuantity {
  const _$UpdateQuantityImpl({required this.product, required this.quantity});

  @override
  final Product product;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartEvent.updateQuantity(product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQuantityImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, quantity);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateQuantityImplCopyWith<_$UpdateQuantityImpl> get copyWith =>
      __$$UpdateQuantityImplCopyWithImpl<_$UpdateQuantityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartItem item) addProduct,
    required TResult Function(Product product) removeProduct,
    required TResult Function() clearCart,
    required TResult Function() getCartItems,
    required TResult Function(Product product, int quantity) updateQuantity,
  }) {
    return updateQuantity(product, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CartItem item)? addProduct,
    TResult? Function(Product product)? removeProduct,
    TResult? Function()? clearCart,
    TResult? Function()? getCartItems,
    TResult? Function(Product product, int quantity)? updateQuantity,
  }) {
    return updateQuantity?.call(product, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartItem item)? addProduct,
    TResult Function(Product product)? removeProduct,
    TResult Function()? clearCart,
    TResult Function()? getCartItems,
    TResult Function(Product product, int quantity)? updateQuantity,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(product, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_RemoveProduct value) removeProduct,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_GetCartItems value) getCartItems,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) {
    return updateQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_RemoveProduct value)? removeProduct,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_GetCartItems value)? getCartItems,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) {
    return updateQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_RemoveProduct value)? removeProduct,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_GetCartItems value)? getCartItems,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateQuantity implements CartEvent {
  const factory _UpdateQuantity(
      {required final Product product,
      required final int quantity}) = _$UpdateQuantityImpl;

  Product get product;
  int get quantity;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateQuantityImplCopyWith<_$UpdateQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartState _$CartStateFromJson(Map<String, dynamic> json) {
  return _CartState.fromJson(json);
}

/// @nodoc
mixin _$CartState {
  List<CartItem> get items => throw _privateConstructorUsedError;

  /// Serializes this CartState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call({List<CartItem> items});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
          _$CartStateImpl value, $Res Function(_$CartStateImpl) then) =
      __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CartItem> items});
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
      _$CartStateImpl _value, $Res Function(_$CartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$CartStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartStateImpl extends _CartState {
  const _$CartStateImpl({required final List<CartItem> items})
      : _items = items,
        super._();

  factory _$CartStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartStateImplFromJson(json);

  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CartState(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartStateImplToJson(
      this,
    );
  }
}

abstract class _CartState extends CartState {
  const factory _CartState({required final List<CartItem> items}) =
      _$CartStateImpl;
  const _CartState._() : super._();

  factory _CartState.fromJson(Map<String, dynamic> json) =
      _$CartStateImpl.fromJson;

  @override
  List<CartItem> get items;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
