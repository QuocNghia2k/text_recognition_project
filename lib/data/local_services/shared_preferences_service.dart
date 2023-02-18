import '../data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class SharedPreferencesService implements ISharedPreferencesService {
  final SharedPreferences sharedPreferences;

  SharedPreferencesService({required this.sharedPreferences});

  @override
  Future<bool> changeLanguage(String languageCode) async {
    return await sharedPreferences.setString(
        SharedPreferencesKey.languageCode, languageCode);
  }

  @override
  Future<String?> getLanguage() async {
    return sharedPreferences.getString(SharedPreferencesKey.languageCode);
  }

  @override
  Future<bool> changeToken(String token) async {
    return await sharedPreferences.setString(SharedPreferencesKey.token, token);
  }

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString(SharedPreferencesKey.token);
  }

  @override
  Future<bool> removeToken() {
    return sharedPreferences.remove(SharedPreferencesKey.token);
  }
}
