part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
 
  const CartState._(); 

  const factory CartState({
    required List<CartItem> items,
  }) = _CartState;

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);


  double get total_price =>
      items.fold(0, (sum, item) => sum + item.total_price);

}

