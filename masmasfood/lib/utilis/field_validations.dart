import 'package:masmas/resources/app_localization.dart';

class FieldValidation {
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return LocalizationMap.getValues('enter_email');
    }
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return LocalizationMap.getValues('please_enter_a_valid_email_address');
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return LocalizationMap.getValues('enter_password');
    } else if (value.length < 8) {
      return LocalizationMap.getValues(
          'password_must_be_atleast_8_characters_long');
    }

    return null;
  }

  static String? validateUserName(String? value) {
    if (value!.isEmpty) {
      return LocalizationMap.getValues('enter_name');
    }

    return null;
  }

  static String? validateMobileNumber(String? value) {
    if (value!.isEmpty) {
      return LocalizationMap.getValues('enter_your_mobile_number');
    }

    return null;
  }

  static String? validatePinCode(String? value) {
    if (value!.isEmpty) {
      return LocalizationMap.getValues('please_enter_your_pin_code');
    } else if (value.length < 4) {
      return LocalizationMap.getValues('please_enter_your_pin_code');
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? text) {
    if (value!.isEmpty) {
      return LocalizationMap.getValues('please_enter_new_password');
    } else if (value.length < 8) {
      return LocalizationMap.getValues(
          'password_must_be_atleast_8_characters_long');
    } else if (value != text) {
      return LocalizationMap.getValues('password_not_match');
    }

    return null;
  }
}
