
import 'package:ecommerce_app/app/features/session/domain/entitites/sign_in_entity.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/admin_sign_in/admin_sign_in_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/admin_sign_in/admin_sign_in_usecase.dart';
import 'admin_sign_in_states.dart';

class AdminSignInBloc extends Bloc<AdminSignInEvents, AdminSignInStates> {

  final AdminSignInUseCase adminSignInUseCase;

  AdminSignInBloc({
    required this.adminSignInUseCase
}) : super( AdminSignInState(valid: false)) {
    var name = '';
    var email = '';
    var phone = '';
    var userName = '';
    var password = '';
    var imageUrl = '';

    bool checkAdminSignInValidation({
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
      if (checkAdminSignInValidation(
        phone: phone,
        name: name,
        email: email,
        password: password,
        userName: userName,
      )) {
        emit(AdminSignInState(valid: true));
      } else {
        emit(AdminSignInState(valid: false));
      }
    });

    on<EmailChanged>((event, emit) {
      email = event.email;
      if (checkAdminSignInValidation(
        phone: phone,
        name: name,
        email: email,
        password: password,
        userName: userName,
      )) {
        emit( AdminSignInState(valid: true));
      } else {
        emit( AdminSignInState(valid: false));
      }
    });

    on<PhoneChanged>((event, emit) {
      phone = event.phone;
      if (checkAdminSignInValidation(
        phone: phone,
        name: name,
        email: email,
        password: password,
        userName: userName,
      )) {
        emit( AdminSignInState(valid: true));
      } else {
        emit( AdminSignInState(valid: false));
      }
    });

    on<UserNameChanged>((event, emit) {
      userName = event.userName;
      if (checkAdminSignInValidation(
        phone: phone,
        name: name,
        email: email,
        password: password,
        userName: userName,
      )) {
        emit( AdminSignInState(valid: true));
      } else {
        emit( AdminSignInState(valid: false));
      }
      ;

      on<PasswordChanged>((event, emit) {
        password = event.password;
        if (checkAdminSignInValidation(
          phone: phone,
          name: name,
          email: email,
          password: password,
          userName: userName,
        )) {
          emit( AdminSignInState(valid: true));
        } else {
          emit( AdminSignInState(valid: false));
        }
      });
    });

    on<ImageUrlChanged>((event, emit) {
      imageUrl = event.imageUrl;
      if (checkAdminSignInValidation(
        phone: phone,
        name: name,
        email: email,
        password: password,
        userName: userName,
      )) {
        emit( AdminSignInState(valid: true));
      } else {
        emit( AdminSignInState(valid: false));
      }
    });

    on<AdminSignInTriggered>((event, emit) async {
      emit(AdminSignInLoadInProgress());
      final adminSignInResult = await adminSignInUseCase(
        signInEntity: SignInEntity(
          userName: userName,
          password: password,
          email: email,
          name: name,
          phone: phone,
          imageUrl: imageUrl
        ),
        accessToken: event.accessToken,
      );

      adminSignInResult.fold(
            (failure) => {
          emit(AdminSignInLoadFailure(failure: failure)),
        },
            (success) => {
          emit(
            AdminSignInLoadSuccess(),
          ),
        },
      );
    });
  }
}
