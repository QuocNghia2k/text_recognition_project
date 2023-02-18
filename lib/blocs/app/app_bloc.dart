import 'dart:async';

import '../../data/data.dart';
import '../../core/core.dart';
import '../../enums.dart';
import '../../theme/theme.dart';
import 'app_state.dart';

class AppBloc extends BaseBloc<AppState> {
  final ISharedPreferencesRepository _prefs;

  AppBloc(this._prefs) {
    emit(AppState(
      locale: LocaleBuilder.getLocale(Language.en.name),
    ));
  }

  Future<void> init() async {
    final languageCode = await _prefs.getLanguage();
    emit(AppState(
      state: state,
      locale: LocaleBuilder.getLocale(languageCode ?? Language.en.name),
    ));
  }

  Future<void> changeLanguage(String languageCode) async {
    await _prefs.changeLanguage(languageCode);
    emit(AppState(
      locale: LocaleBuilder.getLocale(languageCode),
      state: state,
    ));
  }
}
