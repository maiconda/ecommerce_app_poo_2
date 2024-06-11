sealed class AdminSignInEvents {}

final class NameChanged extends AdminSignInEvents {
  final String name;

  NameChanged({required this.name});
}

final class EmailChanged extends AdminSignInEvents {
  final String email;

  EmailChanged({required this.email});
}

final class PhoneChanged extends AdminSignInEvents {
  final String phone;

  PhoneChanged({required this.phone});
}

final class UserNameChanged extends AdminSignInEvents {
  final String userName;

  UserNameChanged({required this.userName});
}

final class PasswordChanged extends AdminSignInEvents {
  final String password;

  PasswordChanged({required this.password});
}

final class ImageUrlChanged extends AdminSignInEvents {
  final String imageUrl;

  ImageUrlChanged({required this.imageUrl});
}

final class AdminSignInTriggered extends AdminSignInEvents {
  final String accessToken;

  AdminSignInTriggered({
    required this.accessToken,
  });
}
