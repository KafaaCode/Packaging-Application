part of 'myorder_bloc.dart';




@freezed
class MyOrdersState with _$MyOrdersState {
  const factory MyOrdersState({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default('') String errorMessage,
    @Default(false) bool isAuth,
    @Default(false) bool isEmpty,
    @Default([]) List<MyOrder> myorders,
    @Default(null) List<MyOrder>? search,
  }) = _Initial;
}