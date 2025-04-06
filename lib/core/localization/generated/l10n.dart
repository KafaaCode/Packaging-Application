// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Lang {
  Lang();

  static Lang? _current;

  static Lang get current {
    assert(_current != null,
        'No instance of Lang was loaded. Try to initialize the Lang delegate before accessing Lang.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Lang> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Lang();
      Lang._current = instance;

      return instance;
    });
  }

  static Lang of(BuildContext context) {
    final instance = Lang.maybeOf(context);
    assert(instance != null,
        'No instance of Lang present in the widget tree. Did you add Lang.delegate in localizationsDelegates?');
    return instance!;
  }

  static Lang? maybeOf(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  /// `Oops! Page Not Found`
  String get pageNotFound {
    return Intl.message(
      'Oops! Page Not Found',
      name: 'pageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `The page you are looking for does not exist.`
  String get pageNotFoundMsg {
    return Intl.message(
      'The page you are looking for does not exist.',
      name: 'pageNotFoundMsg',
      desc: '',
      args: [],
    );
  }

  /// `loding...`
  String get loding {
    return Intl.message(
      'loding...',
      name: 'loding',
      desc: '',
      args: [],
    );
  }

  /// `Connected to the internet`
  String get backOnline {
    return Intl.message(
      'Connected to the internet',
      name: 'backOnline',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get youAreOffline {
    return Intl.message(
      'No internet connection',
      name: 'youAreOffline',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get tilteIntroPage1 {
    return Intl.message(
      ' ',
      name: 'tilteIntroPage1',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get textIntroPage1 {
    return Intl.message(
      ' ',
      name: 'textIntroPage1',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get btnIntroPage1 {
    return Intl.message(
      ' ',
      name: 'btnIntroPage1',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get type {
    return Intl.message(
      ' ',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get academicStage {
    return Intl.message(
      ' ',
      name: 'academicStage',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get basic {
    return Intl.message(
      ' ',
      name: 'basic',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get highSchool {
    return Intl.message(
      ' ',
      name: 'highSchool',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get continueRegistration {
    return Intl.message(
      ' ',
      name: 'continueRegistration',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get female {
    return Intl.message(
      ' ',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get male {
    return Intl.message(
      ' ',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get createAccount {
    return Intl.message(
      ' ',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get loginAStudent {
    return Intl.message(
      ' ',
      name: 'loginAStudent',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get loginTeacher {
    return Intl.message(
      ' ',
      name: 'loginTeacher',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get registration {
    return Intl.message(
      ' ',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get account {
    return Intl.message(
      ' ',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get courses {
    return Intl.message(
      ' ',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get home {
    return Intl.message(
      ' ',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get tests {
    return Intl.message(
      ' ',
      name: 'tests',
      desc: '',
      args: [],
    );
  }

  /// `scientific`
  String get scientific {
    return Intl.message(
      'scientific',
      name: 'scientific',
      desc: '',
      args: [],
    );
  }

  /// `primary`
  String get primary {
    return Intl.message(
      'primary',
      name: 'primary',
      desc: '',
      args: [],
    );
  }

  /// `preparatory`
  String get preparatory {
    return Intl.message(
      'preparatory',
      name: 'preparatory',
      desc: '',
      args: [],
    );
  }

  /// `secondary`
  String get secondary {
    return Intl.message(
      'secondary',
      name: 'secondary',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `literary`
  String get literary {
    return Intl.message(
      'literary',
      name: 'literary',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Lang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'SY'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Lang> load(Locale locale) => Lang.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
