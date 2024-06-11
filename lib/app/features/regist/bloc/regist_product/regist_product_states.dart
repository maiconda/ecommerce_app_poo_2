import '../../../../core/error/failures.dart';

sealed class RegistProductStates {}

final class RegistProductState extends RegistProductStates {
  final bool valid;

  RegistProductState({this.valid = false});
}

final class RegistProductLoadInProgress extends RegistProductStates {
  RegistProductLoadInProgress();
}

final class RegistProductLoadFailure extends RegistProductStates {
  final Failure failure;

  RegistProductLoadFailure({required this.failure});
}

final class RegistProductLoadSuccess extends RegistProductStates {
  RegistProductLoadSuccess();
}
