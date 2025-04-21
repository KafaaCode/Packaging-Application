part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required List<CartItem> items,
  }) = _CartState;

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);
      
}