enum AppRoutes {
  navigation(''),
  login('login');

  const AppRoutes(String path) : _path = path;
  final String _path;

  String toPath() => "/$_path";

  String get name => _path;
}
