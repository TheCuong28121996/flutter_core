abstract class SharedPreferencesRepository {
  final String isLoginKey = "is_login";
  final String accessToken = "access_token";
  final String refreshToken = "refresh_token";

  void setIsLoggedIn(bool value);

  void setAccessToken(String value);

  void setRefreshToken(String value);

  void logout();

  bool get isLoggedIn;

  String? get getAccessToken;

  String? get getRefreshToken;
}
