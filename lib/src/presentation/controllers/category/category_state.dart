part of 'category_bloc.dart';



@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default('') String errorMessage,
    @Default(false) bool isAuth,
    @Default(false) bool isEmpty,
    @Default([]) List<Category> categories,
  }) = _Initial;
}