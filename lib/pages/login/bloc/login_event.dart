part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

final class OnLogin extends LoginEvent {
  const OnLogin({
    required this.userName,
    required this.password,
  });

  final String userName;
  final String password;

  @override
  List<Object> get props => [userName, password];
}