import 'package:base_project/data/models/models.dart';
import 'package:dio/dio.dart';

abstract class AuthServiceRepository {
  Future<BaseResponse> post<T>(String path, {dynamic data, Options? options});
}
