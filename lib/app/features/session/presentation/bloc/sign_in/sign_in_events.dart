sealed class SignInEvents {}

final class NameChanged extends SignInEvents {
  final String name;

  NameChanged({required this.name});
}

final class EmailChanged extends SignInEvents {
  final String email;

  EmailChanged({required this.email});
}

final class PhoneChanged extends SignInEvents {
  final String phone;

  PhoneChanged({required this.phone});
}

final class UserNameChanged extends SignInEvents {
  final String userName;

  UserNameChanged({required this.userName});
}

final class PasswordChanged extends SignInEvents {
  final String password;

  PasswordChanged({required this.password});
}

final class ImageUrlChanged extends SignInEvents {
  final String imageUrl;

  ImageUrlChanged({required this.imageUrl});
}

final class SignInTriggered extends SignInEvents {
  SignInTriggered();
}
