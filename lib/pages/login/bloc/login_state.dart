part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initialLogin() = InitialLoginState;

  const factory LoginState.loading() = LoadingState;

  const factory LoginState.failure(String msg) = FailureState;

  const factory LoginState.success() = SuccessState;
}