// Global variables here
class AppConstants {
  static const String regexPassword =
      r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';

  static const String regexUsername = r'^(?:\d{10}|\w+@\w+\.\w{2,3})$';

  static const String regexEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const String regexNumberPhone =
      r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
}

class SharedPreferencesKey {
  static const String languageCode = 'languageCode';
  static const String token = 'token';
}
