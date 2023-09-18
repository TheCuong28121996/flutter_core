import 'package:base_project/data/models/base_response.dart';
import 'package:dio/dio.dart';

import 'base_service_repository.dart';

class BaseServiceRepositoryImpl extends BaseServiceRepository {
  late Dio _dio;

  BaseServiceRepositoryImpl({required Dio dio}) {
    _dio = dio;
  }

  @override
  Future<BaseResponse> get(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.get(path,
          queryParameters: queryParameters, options: options);
      return BaseResponse.fromDioResponse(response);
    } on DioException catch (e) {
      return BaseResponse.fromDioException(e);
    }
  }

  @override
  Future<BaseResponse> post(String path,
      {data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.post(path,
          data: data, queryParameters: queryParameters, options: options);
      return BaseResponse.fromDioResponse(response);
    } on DioException catch (e) {
      return BaseResponse.fromDioException(e);
    }
  }

  @override
  Future<BaseResponse> patch(String path,
      {data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.patch(path,
          data: data, queryParameters: queryParameters, options: options);
      return BaseResponse.fromDioResponse(response);
    } on DioException catch (e) {
      return BaseResponse.fromDioException(e);
    }
  }

  @override
  Future<BaseResponse> put(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      Options? options}) async {
    try {
      final response = await _dio.put(path,
          data: data, queryParameters: queryParameters, options: options);
      return BaseResponse.fromDioResponse(response);
    } on DioException catch (e) {
      return BaseResponse.fromDioException(e);
    }
  }
}
