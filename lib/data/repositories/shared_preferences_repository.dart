import '../data.dart';

class SharedPreferencesRepository implements ISharedPreferencesRepository {
  final ISharedPreferencesService sharedPreferencesService;

  SharedPreferencesRepository(this.sharedPreferencesService);

  @override
  Future<bool> changeLanguage(String languageCode) {
    return sharedPreferencesService.changeLanguage(languageCode);
  }

  @override
  Future<String?> getLanguage() {
    return sharedPreferencesService.getLanguage();
  }

  @override
  Future<String?> getToken() {
    return sharedPreferencesService.getToken();
  }

  @override
  Future<bool> changeToken(String token) {
    return sharedPreferencesService.changeToken(token);
  }

  @override
  Future<bool> removeToken() {
    return sharedPreferencesService.removeToken();
  }
}
