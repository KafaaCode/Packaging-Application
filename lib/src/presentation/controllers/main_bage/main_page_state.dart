part of 'main_page_bloc.dart';

@freezed
class MainPageState with _$MainPageState {
  const factory MainPageState({
    @Default(0) int selectedIndex,
    String? errorMessage,
    String? successMessage,
    @Default(false) bool isLoading,
  }) = _MainPageState;
}
