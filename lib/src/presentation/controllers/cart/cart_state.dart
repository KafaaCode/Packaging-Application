part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const CartState._(); // ← يسمح بإضافة getters مخصصة

  const factory CartState({
    required List<CartItem> items,
  }) = _CartState;

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);

  // Getter محسوب، ما بيتحول لـ JSON
  double get total_price =>
      items.fold(0, (sum, item) => sum + item.total_price);
}

