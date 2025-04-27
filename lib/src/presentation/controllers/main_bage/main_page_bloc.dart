import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'main_page_event.dart';
part 'main_page_state.dart';
part 'main_page_bloc.freezed.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(const MainPageState(selectedIndex: 0)) {
    on<NavigateToTab>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
  }
}
