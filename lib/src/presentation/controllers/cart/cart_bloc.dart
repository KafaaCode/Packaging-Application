import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:frip_trading/src/data/models/models.dart';

part 'cart_bloc.g.dart';
part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(items: [])) {
    on< _AddProduct>(_onAddProduct);
    on< _RemoveProduct>(_onRemoveProduct);
    on< _ClearCart>(_onClearCart);
    on< _GetCartItems>(_onGetCartItems);
  }

  void _onAddProduct(_AddProduct event, Emitter<CartState> emit) {
    final updatedItems = List<CartItem>.from(state.items)..add(event.item);
    emit(CartState(items: updatedItems));
  }

  void _onRemoveProduct(_RemoveProduct event, Emitter<CartState> emit) {
    final updatedItems = state.items.where((item) => item.product.id != event.product.id).toList();
    emit(CartState(items: updatedItems));
  }

  void _onClearCart(_ClearCart event, Emitter<CartState> emit) {
    emit(const CartState(items: []));
  }

  void _onGetCartItems(_GetCartItems event, Emitter<CartState> emit) {
    emit(CartState(items: state.items));
    print('Cart items: ${state.items}');
  }
  @override
  CartState fromJson(Map<String, dynamic> json) {
    return CartState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(CartState state) {
    return state.toJson();
  }
}