import '../extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class Validator {
  late BuildContext context;

  Validator(BuildContext context) {
    this.context = context;
  }

  String? email(String? txt) {
    if (txt == null || txt.isEmpty) {
      return S.of(context).invalid_email;
    }
    if (!txt.isValidEmail()) {
      return S.of(context).email_format_is_incorrect;
    }
    return null;
  }

  String? phoneNumber(String? txt) {
    if (txt == null || txt.isEmpty) {
      return S.of(context).invalid_phoneNumber;
    }
    if (!txt.isPhoneNumber()) {
      return S.of(context).phoneNumber_format_is_incorrect;
    }
    return null;
  }

  String? username(String? txt) {
    if (txt == null || txt.isEmpty) {
      return S.of(context).please_enter_username;
    }
    if (txt.contains("@") && !txt.isValidEmail()) {
      return S.of(context).email_format_is_incorrect;
    } else if (double.tryParse(txt) != null && !txt.isPhoneNumber()) {
      return S.of(context).phoneNumber_format_is_incorrect;
    } else if (txt.isValidEmail() || txt.isPhoneNumber()) {
      return null;
    } else {
      return S.of(context).please_enter_username;
    }
  }

  String? password(String? txt) {
    if (txt == null || txt.isEmpty) {
      return S.of(context).invalid_password;
    }
    if (!txt.isPassword()) {
      return S.of(context).fill_password;
    } else
      return null;
  }

  String? normalText(String? txt) {
    if (txt == null || txt.isEmpty) {
      return S.of(context).invalid_name;
    } else
      return null;
  }
}
