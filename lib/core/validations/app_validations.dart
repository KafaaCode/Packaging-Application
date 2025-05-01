
import '../../core/validations/reg_exp.dart';

class AppValidators {
  AppValidators._();

  /// Password Validation Function
  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'passwordCannotEmpty'; //passwordCannotEmpty
    }
    if (value.length < 8) {
      return 'passwordMust6Characters'; //PasswordMust6Characters
    }
    if (!AppRegExp.passwordRegex.hasMatch(value)) {
      return 'passwordContainLowercaseNumber' //PasswordContainLowercaseNumber
          ;
    }
    return null;
  }

  /// Username Validation Function
  static String? usernameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'usernameIsRequired'; //usernameIsRequired
    } else if (!AppRegExp.usernameRegex.hasMatch(value)) {
      return 'username3charactersLongNumbers' //username3charactersLongNumbers
          ;
    } else {
      return null;
    }
  }

  /// Email Validation Function
  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterEmailAddress'; //PleaseEnterEmailAddress
    } else if (!AppRegExp.emailRegex.hasMatch(value)) {
      return 'pleaseEnterValidEmail'; //PleaseEnterValidEmail
    }
    return null;
  }

  /// First name Validation Function
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourFirstName'; //pleaseEnterYourFirstName
    }

    if (!AppRegExp.stringRegExp.hasMatch(value)) {
      return 'pleaseEnterOnlyAlphabeticalCharacters'
          ; //PleaseEnterOnlyAlphabeticalCharacters
    }
    return null;
  }

  /// Last name Validation Function
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseRnterYourLastName'; //pleaseRnterYourLastName
    }

    if (!AppRegExp.stringRegExp.hasMatch(value)) {
      return 'pleaseEnterOnlyAlphabeticalCharacters'
          ; //PleaseEnterOnlyAlphabeticalCharacters
    }
    return null;
  }

  /// City Validation Function
  static String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterCityName'; //PleaseEnterCityName
    }

    if (!AppRegExp.cityRegExp.hasMatch(value)) {
      return 'pleaseEnterValidCityName'; //PleaseEnterValidCityName
    }
    return null;
  }

  /// Street name Validation Function
  static String? validateStreet(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterStreetAddress'; //PleaseEnterStreetAddress
    }

    if (!AppRegExp.stringRegExp.hasMatch(value)) {
      return 'pleaseEnterValidStreetAddress'; //PleaseEnterValidStreetAddress
    }
    return null;
  }

  /// Number Validation Function
  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterNumber'; //PleaseEnterNumber
    }

    if (!AppRegExp.numberRegExp.hasMatch(value)) {
      return 'pleaseEnterNumbersOnly'; //PleaseEnterNumbersOnly
    }
    return null;
  }

  /// ZipCode Validation Function
  static String? validateZipCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterZipCode'; //PleaseEnterZipCode
    }

    if (!AppRegExp.zipCodeRegExp.hasMatch(value)) {
      return 'pleaseEnterValidZipCode'; //PleaseEnterValidZipCode
    }
    return null;
  }

  /// Phone Validation Function
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterPhoneNumber'; //pleaseEnterPhoneNumber
    }

    if (!AppRegExp.phoneRegExp.hasMatch(value.replaceAll(RegExp(r'\D+'), ''))) {
      return 'pleaseEnterValidPhoneNumber'; //pleaseEnterValidPhoneNumber
    }
    return null;
  }

  /// card Holder name  Validation Function
  static String? validateCardHolderName(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterTheCardholderName'; //PleaseEnterTheCardholderName
    }
    if (!AppRegExp.stringRegExp.hasMatch(value)) {
      return 'pleaseEnterValidCardholderName'
          ; //PleaseEnterValidCardholderName
    }
    return null;
  }

  /// Card number Validation Function
  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterCreditCardNumber'; //PleaseEnterCreditCardNumber
    }

    if (!AppRegExp.cardNumberRegExp.hasMatch(value)) {
      return 'pleaseEnterValid16digitCreditCardNumber'
          ; //PleaseEnterValid16digitCreditCardNumber
    }

    return null;
  }

  /// Expiration Code Validation Function
  static String? validateExpirationCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'expirationCodeIsRequired'; //expirationCodeIsRequired
    }

    if (!AppRegExp.expirationCodeRegex.hasMatch(value)) {
      return 'expirationCodeMustTheFormat'; //expirationCodeMustTheFormat
    }

    final List<String> parts = value.split('/');
    final int? month = int.tryParse(parts[0]);
    final int? year = int.tryParse(parts[1]);
    final int currentYear = DateTime.now().year % 100;
    final int currentMonth = DateTime.now().month;
    if (month == null || month < 1 || month > 12) {
      return 'Expiration code has an invalid month.';
    } else if (year == null ||
        year < currentYear ||
        (year == currentYear && month < currentMonth)) {
      return 'Expiration code has expired.';
    }

    return null;
  }

  /// Card Security code Validation Function
  static String? validateCardSecurityCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterSecurityCode'; //pleaseEnterSecurityCode
    }
    if (value.length != 3 && value.length != 4) {
      return 'securityCodeShouldDigits'; //securityCodeShouldDigits
    }
    if (!AppRegExp.securityCodeRegex.hasMatch(value)) {
      return 'securityCodeShouldContainOnlyDigits'
          ; //SecurityCodeShouldContainOnlyDigits
    }
    return null;
  }
}
