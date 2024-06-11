import 'package:ecommerce_app/app/features/session/domain/entitites/sign_in_entity.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/login/login_states.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/sign_in/sign_in_events.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/sign_in/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/sign_in/sign_in_usecase.dart';

class SignInBloc extends Bloc<SignInEvents, SignInStates> {

  final SignInUseCase signInUseCase;

  SignInBloc({
    required this.signInUseCase
}) : super( SignInState(valid: false)) {
    var name = '';
    var email = '';
    var phone = '';
    var userName = '';
    var password = '';
    var imageUrl = '';

    bool checkSignInValidation({
      required String name,
      required String email,
      required String phone,
      required String userName,
      required String password,
    }) {
      if (name.isEmpty ||
          email.isEmpty ||
          phone.isEmpty ||
          userName.isEmpty ||
          imageUrl.isEmpty ||
          password.isEmpty) {
        return false;
      } else {
        return true;
      }
    }

    on<NameChanged>((event, emit) {
      name = event.name;
      if (checkSignInValidation(
        phone: phone,
        name: name,
        email: email,
        password: password,
        userName: userName,
      )) {
        emit(SignInState(valid: true));
      } else {
        emit(SignInState(valid: false));
      }
    });

    on<EmailChanged>((event, emit) {
      email = event.email;
      if (checkSignInValidation(
        phone: phone,
        name: name,
        email: email,
        password: password,
        userName: userName,
      )) {
        emit( SignInState(valid: true));
      } else {
        emit( SignInState(valid: false));
      }
    });

    on<PhoneChanged>((event, emit) {
      phone = event.phone;
      if (checkSignInValidation(
        phone: phone,
        name: name,
        email: email,
        password: password,
        userName: userName,
      )) {
        emit( SignInState(valid: true));
      } else {
        emit( SignInState(valid: false));
      }
    });

    on<UserNameChanged>((event, emit) {
      userName = event.userName;
      if (checkSignInValidation(
        phone: phone,
        name: name,
        email: email,
        password: password,
        userName: userName,
      )) {
        emit( SignInState(valid: true));
      } else {
        emit( SignInState(valid: false));
      }
      ;

      on<PasswordChanged>((event, emit) {
        password = event.password;
        if (checkSignInValidation(
          phone: phone,
          name: name,
          email: email,
          password: password,
          userName: userName,
        )) {
          emit( SignInState(valid: true));
        } else {
          emit( SignInState(valid: false));
        }
      });
    });

    on<ImageUrlChanged>((event, emit) {
      imageUrl = event.imageUrl;
      if (checkSignInValidation(
        phone: phone,
        name: name,
        email: email,
        password: password,
        userName: userName,
      )) {
        emit( SignInState(valid: true));
      } else {
        emit( SignInState(valid: false));
      }
    });

    on<SignInTriggered>((event, emit) async {
      emit(SignInLoadInProgress());
      final signInResult = await signInUseCase(
        signInEntity: SignInEntity(
          userName: userName,
          password: password,
          email: email,
          name: name,
          phone: phone,
          imageUrl: imageUrl
        )
      );

      signInResult.fold(
            (failure) => {
          emit(SignInLoadFailure(failure: failure)),
        },
            (success) => {
          emit(
            SignInLoadSuccess(),
          ),
        },
      );
    });
  }
}
