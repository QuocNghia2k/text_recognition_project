import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(AppConstants.regexEmail).hasMatch(this);
  }

  bool isPhoneNumber() {
    return RegExp(AppConstants.regexNumberPhone).hasMatch(this);
  }

  bool isUsername() {
    return RegExp(AppConstants.regexUsername).hasMatch(this);
  }

  bool isPassword() {
    return RegExp(AppConstants.regexPassword).hasMatch(this);
  }
}

extension TimeStampExtention on Timestamp {
  String convertDateFormat() {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(this.toDate().toString());
    return inputDate.toString().replaceAll(":00.000", "");
  }
}
