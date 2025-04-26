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

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Get Started`
  String get letsGetStarted {
    return Intl.message(
      'Let’s Get Started',
      name: 'letsGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `omar`
  String get omar {
    return Intl.message(
      'omar',
      name: 'omar',
      desc: '',
      args: [],
    );
  }

  /// `ali`
  String get ali {
    return Intl.message(
      'ali',
      name: 'ali',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Frip Trading`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to Frip Trading',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Product categories`
  String get productCategoriesTitle {
    return Intl.message(
      'Product categories',
      name: 'productCategoriesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get productTitle {
    return Intl.message(
      'Product',
      name: 'productTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cateogries not found`
  String get cateogriesNotFoundMessage {
    return Intl.message(
      'Cateogries not found',
      name: 'cateogriesNotFoundMessage',
      desc: '',
      args: [],
    );
  }

  /// `Products not found`
  String get productsNotFoundMessage {
    return Intl.message(
      'Products not found',
      name: 'productsNotFoundMessage',
      desc: '',
      args: [],
    );
  }

  /// `Clothing Packaging Category Products`
  String get productCategoryDescription {
    return Intl.message(
      'Clothing Packaging Category Products',
      name: 'productCategoryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get priceLabel {
    return Intl.message(
      'Price',
      name: 'priceLabel',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get descriptionLabel {
    return Intl.message(
      'Description',
      name: 'descriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Read more`
  String get readMoreButton {
    return Intl.message(
      'Read more',
      name: 'readMoreButton',
      desc: '',
      args: [],
    );
  }

  /// `Read less`
  String get readLessButton {
    return Intl.message(
      'Read less',
      name: 'readLessButton',
      desc: '',
      args: [],
    );
  }

  /// `The minimum order for this`
  String get minimumOrderText {
    return Intl.message(
      'The minimum order for this',
      name: 'minimumOrderText',
      desc: '',
      args: [],
    );
  }

  /// `product is`
  String get productIsText {
    return Intl.message(
      'product is',
      name: 'productIsText',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get addToCartButton {
    return Intl.message(
      'Add To Cart',
      name: 'addToCartButton',
      desc: '',
      args: [],
    );
  }

  /// `Cart Details`
  String get cartDetailsTitle {
    return Intl.message(
      'Cart Details',
      name: 'cartDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `The product already exists in the same quantity in cart`
  String get productAlreadyExistsMessage {
    return Intl.message(
      'The product already exists in the same quantity in cart',
      name: 'productAlreadyExistsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Product added to cart`
  String get productAddedToCartMessage {
    return Intl.message(
      'Product added to cart',
      name: 'productAddedToCartMessage',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrdersTitle {
    return Intl.message(
      'My Orders',
      name: 'myOrdersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Orders not found`
  String get ordersNotFoundMessage {
    return Intl.message(
      'Orders not found',
      name: 'ordersNotFoundMessage',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetailsTitle {
    return Intl.message(
      'Order Details',
      name: 'orderDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Continue to confirm the order`
  String get continueToConfirmOrderButton {
    return Intl.message(
      'Continue to confirm the order',
      name: 'continueToConfirmOrderButton',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get payButton {
    return Intl.message(
      'Pay',
      name: 'payButton',
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
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'FR'),
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
