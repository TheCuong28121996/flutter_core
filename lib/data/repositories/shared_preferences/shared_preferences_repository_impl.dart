import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_repository.dart';

class SharedPreferencesRepositoryImpl extends SharedPreferencesRepository {
  SharedPreferencesRepositoryImpl(this.prefs);

  final SharedPreferences prefs;

  @override
  bool get isLoggedIn => prefs.getBool(isLoginKey) ?? false;

  @override
  Future<void> setIsLoggedIn(bool value) {
    return prefs.setBool(isLoginKey, value);
  }
}