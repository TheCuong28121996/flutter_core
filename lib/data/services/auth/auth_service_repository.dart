import 'package:base_project/data/models/models.dart';
import 'package:dio/dio.dart';

abstract class AuthServiceRepository {
  Future<BaseResponse> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters, Options? options});
}
