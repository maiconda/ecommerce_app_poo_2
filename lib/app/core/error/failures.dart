abstract class Failure {}

class ServerFailure extends Failure {}

class DisconnectedFailure extends Failure {}

class AuthFailure extends Failure {
  final bool locked;

  AuthFailure({this.locked = false});
}

class SessionFailure extends Failure {}

class PermissionFailure extends Failure {}
