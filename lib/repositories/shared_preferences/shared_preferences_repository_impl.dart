import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_repository.dart';

class SharedPreferencesRepositoryImpl extends SharedPreferencesRepository {
  SharedPreferencesRepositoryImpl(SharedPreferences prefs) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  bool get isLoggedIn => _prefs.getBool(isLoginKey) ?? false;

  @override
  void setIsLoggedIn(bool value) => _prefs.setBool(isLoginKey, value);

  @override
  String? get getAccessToken => _prefs.getString(accessToken);

  @override
  void setAccessToken(String value) => _prefs.setString(accessToken, value);

  @override
  String? get getRefreshToken => _prefs.getString(refreshToken);

  @override
  void setRefreshToken(String value) => _prefs.setString(refreshToken, value);

  @override
  void logout() {
    _prefs.remove(isLoginKey);
    _prefs.remove(accessToken);
    _prefs.remove(refreshToken);
  }
}
