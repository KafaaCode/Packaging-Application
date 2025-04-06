import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState()){
    emit(state.copyWith(supportedLanguages: _supportedLanguages));
  }


  void changeLanguageTo(String code)  {
    emit(state.copyWith(locale: Locale(code)));
  }

  List<SupportedLanguage> get _supportedLanguages {
    return [
      SupportedLanguage(
        langName: 'العربية',
        langCode: 'ar',
        countryCode: 'SY',
      ),
      SupportedLanguage(
        langName: 'English',
        langCode: 'en',
        countryCode: 'US',
      )
    ];
  }
}

class SupportedLanguage {
  final String langName;
  final String langCode;
  final String countryCode;

  SupportedLanguage({
    required this.langName,
    required this.langCode,
    required this.countryCode,
  });
}
