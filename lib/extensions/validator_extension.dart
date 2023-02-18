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
