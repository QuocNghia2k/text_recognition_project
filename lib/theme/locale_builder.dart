import 'dart:ui';

import '../enums.dart';

/// Handle this logic when add/remove locale
class LocaleBuilder {
  static Locale getLocale(String languageCode) {
    switch (languageCode) {
      case 'ko':
        return Locale(languageCode, 'KR');
      case 'en':
        return Locale(languageCode, 'US');
      default:
        return Locale(Language.en.name, 'US');
    }
  }
}
