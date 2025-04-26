import 'package:flutter/material.dart';
import 'package:frip_trading/core/utils/abstracts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  LanguageCubit() : super(LanguageState()) {
    emit(state.copyWith(supportedLanguages: supportedLanguages));
  }

  void changeLanguageTo(String code) {
    emit(state.copyWith(locale: Locale(code)));
  }

  static List<SupportedLanguage> get supportedLanguages {
    return [
      SupportedLanguage(
        langName: 'English',
        langCode: 'en',
        countryCode: 'US',
      ),
      SupportedLanguage(
        langName: 'French',
        langCode: 'fr',
        countryCode: 'FR',
      ),
      SupportedLanguage(
        langName: 'العربية',
        langCode: 'ar',
        countryCode: 'SY',
      ),
    ];
  }

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    return LanguageState(
      locale: Locale(json['langCode']),
    );
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    return {
      'langCode': state.locale.languageCode,
    };
  }
}

class SupportedLanguage extends HasIdAndName {
  final String langName;
  final String langCode;
  final String countryCode;

  SupportedLanguage({
    required this.langName,
    required this.langCode,
    required this.countryCode,
  });

  @override
  Object get id => langCode;

  @override
  String get name => langName;
  
  @override
  List<Object?> get props => [langName, langCode, countryCode];
}
