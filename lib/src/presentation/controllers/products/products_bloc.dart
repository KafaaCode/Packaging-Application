
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/domin/repository/main_repository.dart';

part 'products_state.dart';
part 'products_event.dart';
part 'products_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final BaseMainRepository mainRepository;

  ProductBloc({required this.mainRepository})
      : super(const ProductState()) {
    on<_GetProducts>(_getProductsEvent);
   
  }
  void _getProductsEvent(event, emit) async {
    emit(state.copyWith(loading: true));
    
    final result = await mainRepository.getProducts( categoryId: event.categoryId);
 
    result.fold(
      (l) => emit(state.copyWith(
          loading: false,
          error: true,
          errorMessage: l.message,
          products: state.products)),
      (r) => emit(state.copyWith(loading: false, isDone: true, products: r)),
    );
  }

  
}
