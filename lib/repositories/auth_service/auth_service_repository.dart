import 'package:dio/dio.dart';

import '../../models/models.dart';

abstract class AuthServiceRepository {
  Future<AuthResponse> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters, Options? options});
}
