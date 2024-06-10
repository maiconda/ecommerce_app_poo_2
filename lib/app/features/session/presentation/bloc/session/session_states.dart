sealed class SessionStates {}

final class SessionInitial extends SessionStates {
  SessionInitial();
}

final class SessionSituation extends SessionStates {
  final bool logged;
  final String? accessToken;
  final String? email;
  final String? phone;
  final String? name;
  final String? userName;
  final String? password;

  SessionSituation({
    required this.logged,
    required this.accessToken,
    required this.email,
    required this.phone,
    required this.name,
    required this.userName,
    required this.password,
  });
}
