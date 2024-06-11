import '../../../../../core/error/failures.dart';

sealed class AdminSignInStates {}

final class AdminSignInState extends AdminSignInStates {
  final bool valid;

  AdminSignInState({this.valid = false});
}

final class AdminSignInLoadInProgress extends AdminSignInStates {
  AdminSignInLoadInProgress();
}

final class AdminSignInLoadFailure extends AdminSignInStates {
  final Failure failure;

  AdminSignInLoadFailure({required this.failure});
}

final class AdminSignInLoadSuccess extends AdminSignInStates {
  AdminSignInLoadSuccess();
}

