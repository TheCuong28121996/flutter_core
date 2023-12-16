import '../../models/models.dart';

abstract class AuthenticationRepository {
  Future<AuthResponse> login({required String userName, required String password});
}
