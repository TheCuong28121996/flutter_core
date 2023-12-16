import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/repositories.dart';

part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required SharedPreferencesRepository sharedPreferencesRepository,
    required AuthenticationRepository authRepository,
  })  : _sharedPreferencesRepository = sharedPreferencesRepository,
        _authRepository = authRepository,
        super(const InitialLoginState()) {
    on<OnLogin>(_onLogin);
  }

  final SharedPreferencesRepository _sharedPreferencesRepository;
  final AuthenticationRepository _authRepository;

  Future<void> _onLogin(
    OnLogin event,
    Emitter<LoginState> emit,
  ) async {

  }
}
