
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'counter_state.dart';
part 'counter_event.dart';
part 'counter_bloc.freezed.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc({required int min, required int initial})
      : super(CounterState(count: initial, min: min)) {
    on<Increment>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });

    on<Decrement>((event, emit) {
      if (state.count > state.min) {
        emit(state.copyWith(count: state.count - 1));
      }
    });
  }
}


