import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frip_trading/admin/screens/products/product_model.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/domin/repository/main_repository.dart';

part 'products_state.dart';
part 'products_event.dart';
part 'products_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final BaseMainRepository mainRepository;

  ProductBloc({required this.mainRepository}) : super(const ProductState()) {
    on<_GetProducts>(_getProductsEvent);
    on<_Search>(_searchEvent);
  }
  void _getProductsEvent(event, emit) async {
    emit(state.copyWith(loading: true));

    final result =
        await mainRepository.getProducts(categoryId: event.categoryId);

    result.fold(
      (l) => emit(state.copyWith(
          loading: false,
          error: true,
          errorMessage: l.message,
          products: state.products)),
      (r) => emit(state.copyWith(loading: false, isDone: true, products: r)),
    );
  }

  void _searchEvent(event, emit) {
    print(event.value);
    if (event.value != null || event.value != '') {
      final query = event.value?.toLowerCase().trim() ?? '';
      List<Product> products = state.products.where((e) {
        final name = e.name.toLowerCase();
        return name.contains(query);
      }).toList();
      print(products);
      emit(state.copyWith(search: products));
    } else {
      emit(state.copyWith(search: null));
    }
  }
}
