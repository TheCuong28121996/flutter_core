import 'package:base_project/data/models/base_response.dart';
import 'package:dio/dio.dart';
import 'auth_service_repository.dart';

class AuthServiceRepositoryImpl extends AuthServiceRepository{
  late Dio _client;

  AuthServiceRepositoryImpl({required Dio client}) {
    _client = client;
  }

  @override
  Future<BaseResponse> post<T>(String path,
      {Object? data, Options? options}) async {
    try {
      final response = await _client.post(path, data: data, options: options);
      return BaseResponse.fromDioResponse(response);
    } on DioException catch (e) {
      return BaseResponse.fromDioException(e);
    }
  }
}
