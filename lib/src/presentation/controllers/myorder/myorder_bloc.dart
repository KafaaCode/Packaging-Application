import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/domin/repository/main_repository.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'myorder_state.dart';
part 'myorder_event.dart';
part 'myorder_bloc.freezed.dart';

class MyOrdersBloc extends Bloc<MyOrdersEvent, MyOrdersState> {
  final BaseMainRepository baseMainRepository;

  MyOrdersBloc(this.baseMainRepository) : super(const MyOrdersState()) {
    on<MyOrdersEvent>((event, emit) async {
      await event.mapOrNull(
        getMyOrders: (value) async {
          emit(state.copyWith(
              error: false, isAuth: false, isEmpty: false, loading: true));

          final response = await baseMainRepository.getmyOrders();
          print(response);

          await response.fold(
            (l) async {
              emit(state.copyWith(
                  loading: false,
                  error: true,
                  errorMessage: l.message,
                  myorders: state.myorders));
            },
            (r) async {
              emit(state.copyWith(
                  loading: false,
                  error: false,
                  isAuth: true,
                  isEmpty: false,
                  myorders: r));
            },
          );
        },
      );
    });
    on<_Search>(_searchEvent);
  }
  void _searchEvent(event, emit) {
    print(event.value);
    if (event.value != null || event.value != '') {
      final query = event.value?.trim() ?? '';
      List<MyOrder> myOrders = state.myorders.where((e) {
        final name = e.serial_number;
        return name?.contains(query) ?? false;
      }).toList();
      print(myOrders);
      emit(state.copyWith(search: myOrders));
    } else {
      emit(state.copyWith(search: null));
    }
  }
}
