part of 'inital_bloc.dart';

@freezed
class InitalState with _$InitalState {
  const factory InitalState.initial() = _Initial;
  const factory InitalState.loadInProgress() = _LoadInProgress;
  const factory InitalState.loaded(
      {required SpecializationAndCountry specializationAndCountry}) = _Loaded;
  const factory InitalState.loadFailure({required String message}) =
      _LoadFailure;
}
