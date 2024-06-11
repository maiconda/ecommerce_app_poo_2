import 'package:ecommerce_app/app/features/session/domain/entitites/login_entity.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/login/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/login/login_usecase.dart';
import 'login_events.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginState(valid: false)) {
    var password = '';
    var userName = '';

    bool checkLoginValidation(
        {required String userName, required String password}) {
      if (userName.isEmpty || password.isEmpty) {
        return false;
      } else {
        return true;
      }
    }

    on<UserNameChanged>((event, emit) {
      userName = event.userName;
      if (checkLoginValidation(
        password: password,
        userName: userName,
      )) {
        emit(LoginState(valid: true));
      } else {
        emit(LoginState(valid: false));
      }
    });

    on<PasswordChanged>((event, emit) {
      password = event.password;
      if (checkLoginValidation(
        password: password,
        userName: userName,
      )) {
        emit(LoginState(valid: true));
      } else {
        emit(LoginState(valid: false));
      }
    });

    on<LoginTriggered>((event, emit) async {
      emit(LoginLoadInProgress());
      final loginResult = await loginUseCase(
        loginEntity: LoginEntity(
          userName: userName,
          password: password,
      ));

      loginResult.fold(
        (failure) => {
          emit(LoginLoadFailure(failure: failure)),
        },
        (success) => {
          emit(
            LoginLoadSuccess(
              userEntity: success,
            ),
          ),
        },
      );
    });
  }
}
