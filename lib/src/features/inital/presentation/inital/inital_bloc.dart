import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/features/inital/domain/repository/inital_repository.dart';

part 'inital_state.dart';
part 'inital_event.dart';
part 'inital_bloc.freezed.dart';

class InitalBloc extends Bloc<InitalEvent, InitalState> {
  final BaseInitalRepository initalRepository;
  InitalBloc({required this.initalRepository})
      : super(const InitalState.initial()) {
    on<_GetInitalData>(_getInitalData);
  }
  Future<void> _getInitalData(
      _GetInitalData event, Emitter<InitalState> emit) async {
    emit(const InitalState.loadInProgress());
    try {
      final specializationAndCountry = await initalRepository.getInitalData();
      print('specializationAndCountry: ${specializationAndCountry.toString()}');
      specializationAndCountry.fold(
        (failure) {
          emit(InitalState.loadFailure(message: failure.message));
        },
        (specializationAndCountry) {
          emit(InitalState.loaded(
              specializationAndCountry: specializationAndCountry));
        },
      );
    } catch (e) {
      emit(InitalState.loadFailure(message: e.toString()));
    }
  }
}
