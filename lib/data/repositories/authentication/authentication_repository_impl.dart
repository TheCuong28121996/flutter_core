import 'package:base_project/common/commons.dart';
import 'package:base_project/config/app_env.dart';
import 'package:base_project/data/models/models.dart';
import 'package:base_project/data/services/services.dart';
import 'package:dio/dio.dart';

import 'authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  late final AuthServiceRepository _service;

  AuthenticationRepositoryImpl({required AuthServiceRepository service}) {
    _service = service;
  }

  @override
  Future<BaseResponse> login(
      {required String phoneNumber, required String password}) async {
    var formData = FormData.fromMap({
      'username': phoneNumber,
      'password': password,
      'client_secret': AppEnv().clientSecret,
      'client_id': AppEnv().clientId,
      'grant_type': AppEnv().grantType,
      'app_key': AppEnv().appKey
    });

    return await _service.post(EndPoint.loginUrl, data: formData);
  }
}
