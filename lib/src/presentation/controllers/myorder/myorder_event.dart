part of 'myorder_bloc.dart';

@freezed
class MyOrdersEvent with _$MyOrdersEvent {
  const factory MyOrdersEvent.getMyOrders() = _GetMyOrders;
}
