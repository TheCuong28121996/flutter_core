import 'package:base_project/common/commons.dart';
import 'package:base_project/config/app_env.dart';
import 'package:dio/dio.dart';

import '../../models/models.dart';
import '../repositories.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  late final AuthServiceRepository _service;

  AuthenticationRepositoryImpl({required AuthServiceRepository service}) {
    _service = service;
  }

  @override
  Future<AuthResponse> login(
      {required String userName, required String password}) async {
    final formData = FormData.fromMap({
      'username': userName,
      'password': password,
      'client_secret': AppEnv().clientSecret,
      'client_id': AppEnv().clientId,
      'grant_type': AppEnv().grantType,
      'app_key': AppEnv().appKey
    });

    return await _service.post(EndPoint.loginUrl, data: formData);
  }
}
