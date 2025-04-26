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

  /// `Please enter your data to continue`
  String get plsEnterDataToContiubue {
    return Intl.message(
      'Please enter your data to continue',
      name: 'plsEnterDataToContiubue',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEamilLabel {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEamilLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEamilHint {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEamilHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordHint {
    return Intl.message(
      'Password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `'Forget Password?`
  String get forgetPassword {
    return Intl.message(
      '\'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Signin`
  String get signin {
    return Intl.message(
      'Signin',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get companyNameHint {
    return Intl.message(
      'Company Name',
      name: 'companyNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullNameHint {
    return Intl.message(
      'Full name',
      name: 'fullNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Valid email`
  String get eamilHint {
    return Intl.message(
      'Valid email',
      name: 'eamilHint',
      desc: '',
      args: [],
    );
  }

  /// `Select Specialization`
  String get selectSpecializationLabel {
    return Intl.message(
      'Select Specialization',
      name: 'selectSpecializationLabel',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountryLabel {
    return Intl.message(
      'Select Country',
      name: 'selectCountryLabel',
      desc: '',
      args: [],
    );
  }

  /// `By checking the box you agree to our `
  String get byCheckingTheBoxYouAgreeToOur {
    return Intl.message(
      'By checking the box you agree to our ',
      name: 'byCheckingTheBoxYouAgreeToOur',
      desc: '',
      args: [],
    );
  }

  /// `Terms`
  String get trems {
    return Intl.message(
      'Terms',
      name: 'trems',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get and {
    return Intl.message(
      ' and ',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Conditions`
  String get conditions {
    return Intl.message(
      'Conditions',
      name: 'conditions',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Already a member?`
  String get alreadyAMember {
    return Intl.message(
      'Already a member?',
      name: 'alreadyAMember',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get currentPassword {
    return Intl.message(
      'Current password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Current password...`
  String get currentPasswordLabel {
    return Intl.message(
      'Current password...',
      name: 'currentPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `enter new password...`
  String get newPasswordLabel {
    return Intl.message(
      'enter new password...',
      name: 'newPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `enter confirm password...`
  String get confirmPasswordLabel {
    return Intl.message(
      'enter confirm password...',
      name: 'confirmPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password ?`
  String get forgotYourPassword {
    return Intl.message(
      'Forgot your password ?',
      name: 'forgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get accountSettings {
    return Intl.message(
      'Account Settings',
      name: 'accountSettings',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Select language`
  String get selectLanguage {
    return Intl.message(
      'Select language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Select language`
  String get selectLanguageHint {
    return Intl.message(
      'Select language',
      name: 'selectLanguageHint',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and conditions',
      name: 'termsAndConditions',
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
