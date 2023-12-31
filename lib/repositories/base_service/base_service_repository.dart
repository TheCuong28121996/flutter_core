import 'package:dio/dio.dart';

import '../../models/models.dart';

abstract class BaseServiceRepository {
  Future<BaseResponse> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters, Options? options});

  Future<BaseResponse> get(String path,
      {Map<String, dynamic>? queryParameters, Options? options});

  Future<BaseResponse> patch(String path,
      {Map<String, dynamic>? queryParameters, Object? data, Options? options});

  Future<BaseResponse> put(String path,
      {Map<String, dynamic>? queryParameters, Object? data, Options? options});
}
