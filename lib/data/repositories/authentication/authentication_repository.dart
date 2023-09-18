import 'package:base_project/data/models/models.dart';

abstract class AuthenticationRepository {
  Future<BaseResponse> login({required String phoneNumber, required String password});
}
