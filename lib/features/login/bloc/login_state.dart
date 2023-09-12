part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginFail extends LoginState {
  @override
  List<Object> get props => [];
}
