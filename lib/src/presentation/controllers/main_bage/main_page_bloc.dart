import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frip_trading/src/domin/repository/main_repository.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';
part 'main_page_bloc.freezed.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final BaseMainRepository _mainRepository;
  MainPageBloc(this._mainRepository)
      : super(const MainPageState(selectedIndex: 0)) {
    on<_ResetState>((event, emit) {
      // This handler resets the state to its initial, default values.
      emit(const MainPageState());
    });
    on<NavigateToTab>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
    on<_SendSupport>(_sentSupportEvent);
    on<_AddOrder>(_addOrderEvent);
  }
  void _addOrderEvent(event, emit) async {
    emit(state.copyWith(errorMessage: '', successMessage: ''));
    final result = await _mainRepository.addOrder(
      orderData: event.orderData,
    );
    result.fold(
        (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message)),
        (success) {
      emit(state.copyWith(isLoading: false));
    });
  }

  void _sentSupportEvent(event, emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: '', successMessage: ''));
    final result = await _mainRepository.sendSupport(
      title: event.title,
      message: event.message,
      senderName: event.senderName,
      senderEmail: event.senderEmail,
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (success) => emit(state.copyWith(
          selectedIndex: 0,
          isLoading: false,
          successMessage: 'Support sent successfully')),
    );
  }
}
