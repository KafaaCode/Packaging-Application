part of 'products_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.getProducts({required int categoryId}) =
      _GetProducts;
  
}
