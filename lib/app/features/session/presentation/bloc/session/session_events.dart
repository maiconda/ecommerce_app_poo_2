sealed class SessionEvents {}

final class SessionSituationChange extends SessionEvents {
  final bool logged;
  final String accessToken;
  final String email;
  final String phone;
  final String name;
  final String userName;
  final String password;

  SessionSituationChange({required this.logged, required this.accessToken, required this.email, required this.phone, required this.name, required this.userName, required this.password});
}

class SessionStarted extends SessionEvents {
  SessionStarted();
}
