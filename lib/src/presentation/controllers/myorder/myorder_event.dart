part of 'myorder_bloc.dart';

@freezed
class MyOrdersEvent with _$MyOrdersEvent {
  const factory MyOrdersEvent.getMyOrders() = _GetMyOrders;
   const factory MyOrdersEvent.search({required String value}) = _Search;
}
