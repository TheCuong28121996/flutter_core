import 'package:base_project/common/commons.dart';
import 'package:base_project/data/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authRepository;

  LoginBloc({required AuthenticationRepository authRepository})
      : _authRepository = authRepository,
        super(InitialState()) {
    on<LoginSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(LoginSubmitted event,
      Emitter<LoginState> emit,) async {
    emit(const LoadingState(isShow: true));

    await Future.delayed(const Duration(seconds: 3), (){
      emit(const LoadingState(isShow: false));
    });

    // try {
    //   await _authRepository.login(phoneNumber: phoneNumber, password: password)
    // } catch (error) {
    //   DebugLog().show(error.toString());
    // } finally {
    //   emit(HideLoading());
    // }
  }
}
