sealed class LoginEvents {}

final class UserNameChanged extends LoginEvents {
  final String userName;

  UserNameChanged({required this.userName});
}

final class PasswordChanged extends LoginEvents {
  final String password;

  PasswordChanged({required this.password});
}

final class LoginTriggered extends LoginEvents {
  LoginTriggered();
}
