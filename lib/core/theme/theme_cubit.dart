import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemesCubit extends HydratedCubit<ThemeMode> {
  ThemesCubit() : super(ThemeMode.light);

  Future<void> loadSettings() async {
    emit(ThemeMode.light);
  }

  void updateThemeMode(ThemeMode themeMode) {
    state != themeMode ? emit(themeMode) : null;
  }

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    switch (json['themeMode'] as String?) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {
      'themeMode': state == ThemeMode.dark
          ? 'dark'
          : state == ThemeMode.light
              ? 'light'
              : 'system',
    };
  }
}
