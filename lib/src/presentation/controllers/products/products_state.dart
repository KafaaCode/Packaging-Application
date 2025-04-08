part of 'products_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default('') String errorMessage,
    @Default(false) bool isDone,
    @Default(false) bool isEmpty,
    @Default([]) List<Product> products,
  }) = _ProductState;
}
