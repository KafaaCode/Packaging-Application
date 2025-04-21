part of 'cart_bloc.dart';


@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.addProduct(CartItem item) = _AddProduct;
  const factory CartEvent.removeProduct(Product product) = _RemoveProduct;
  const factory CartEvent.clearCart() = _ClearCart;
  const factory CartEvent.getCartItems() = _GetCartItems;
}