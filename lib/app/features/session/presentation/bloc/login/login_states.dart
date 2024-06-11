import '../../../../../core/error/failures.dart';
import '../../../domain/entitites/user_entity.dart';

sealed class LoginStates {}

final class LoginState extends LoginStates {
  final bool valid;

  LoginState({this.valid = false});
}

final class LoginLoadInProgress extends LoginStates {
  LoginLoadInProgress();
}

final class LoginLoadFailure extends LoginStates {
  final Failure failure;

  LoginLoadFailure({required this.failure});
}

final class LoginLoadSuccess extends LoginStates {
  final UserEntity userEntity;

  LoginLoadSuccess({
    required this.userEntity,
  });
}
