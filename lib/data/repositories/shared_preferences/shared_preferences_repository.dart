abstract class SharedPreferencesRepository {
  final String isLoginKey = "IsLoggedIn";

  bool get isLoggedIn;

  Future<void> setIsLoggedIn(bool value);
}
