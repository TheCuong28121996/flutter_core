part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class InitialState extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoadingState extends LoginState {
  const LoadingState({this.isShow = false});

  final bool isShow;

  @override
  List<Object> get props => [isShow];
}

final class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginFail extends LoginState {
  @override
  List<Object> get props => [];
}
