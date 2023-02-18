abstract class ISharedPreferencesService {
  Future<String?> getLanguage();

  Future<bool> changeLanguage(String languageCode);

  Future<String?> getToken();

  Future<bool> changeToken(String token);

  Future<bool> removeToken();
}
