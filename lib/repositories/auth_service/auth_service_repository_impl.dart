import 'package:dio/dio.dart';
import '../../models/models.dart';
import 'auth_service_repository.dart';

class AuthServiceRepositoryImpl extends AuthServiceRepository {
  AuthServiceRepositoryImpl(Dio dio) : _dio = dio;

  final Dio _dio;

  @override
  Future<AuthResponse> post(String path,
      {data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return AuthResponse.fromDioResponse(response);
    } on DioException catch (e) {
      return AuthResponse.fromDioException(e);
    }
  }
}
