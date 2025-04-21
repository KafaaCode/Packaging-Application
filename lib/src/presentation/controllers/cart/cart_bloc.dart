import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:bloc/bloc.dart';
part 'cart_bloc.g.dart';
part'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';



class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc() : super(CartState(items: []));

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    yield* event.map(
      addProduct: (e) async* {
        final updatedItems = List<CartItem>.from(state.items);
        updatedItems.add(e.item);
        yield CartState(items: updatedItems);
      },
      removeProduct: (e) async* {
        final updatedItems = state.items.where((item) => item.product.id != e.product.id).toList();
        yield CartState(items: updatedItems);
      },
      clearCart: (_) async* {
        yield CartState(items: []);
      },
    );
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    return CartState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    return state.toJson();
  }
}



