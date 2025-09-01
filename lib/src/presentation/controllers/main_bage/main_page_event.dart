part of 'main_page_bloc.dart';

@freezed
class MainPageEvent with _$MainPageEvent {
  const factory MainPageEvent.navigateToTab(int index) = NavigateToTab;
  const factory MainPageEvent.resetState() = _ResetState;
  const factory MainPageEvent.sendSupport(
      {required String title,
      required String message,
      required String senderName,
      required String senderEmail}) = _SendSupport;
  const factory MainPageEvent.addOrder(
      {required Map<String, dynamic> orderData}) = _AddOrder;
}
