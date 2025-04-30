part of 'category_bloc.dart';

@freezed
class CategoriesEvent with _$CategoriesEvent {
  const factory CategoriesEvent.getCategories() = _GetCategories;
  const factory CategoriesEvent.search({required String value}) = _Search;

}
