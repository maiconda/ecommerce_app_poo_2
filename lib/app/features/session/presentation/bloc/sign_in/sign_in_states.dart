import '../../../../../core/error/failures.dart';

sealed class SignInStates {}

final class SignInState extends SignInStates {
  final bool valid;

  SignInState({this.valid = false});
}

final class SignInLoadInProgress extends SignInStates {
  SignInLoadInProgress();
}

final class SignInLoadFailure extends SignInStates {
  final Failure failure;

  SignInLoadFailure({required this.failure});
}

final class SignInLoadSuccess extends SignInStates {
  SignInLoadSuccess();
}

