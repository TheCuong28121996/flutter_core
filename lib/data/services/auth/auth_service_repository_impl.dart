import 'package:base_project/data/models/models.dart';
import 'package:dio/dio.dart';

import 'auth_service_repository.dart';

class AuthServiceRepositoryImpl extends AuthServiceRepository {
  late Dio _dio;

  AuthServiceRepositoryImpl({required Dio dio}) {
    _dio = dio;
  }

  @override
  Future<BaseResponse> post(String path,
      {data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.post(path,
          data: data, queryParameters: queryParameters, options: options);
      return BaseResponse.fromDioRawResponse(response);
    } on DioException catch (e) {
      return BaseResponse.fromDioRawException(e);
    }
  }
}
