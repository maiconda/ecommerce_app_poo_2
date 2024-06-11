import '../../../domain/entitites/role_entity.dart';

sealed class SessionStates {}

final class SessionInitial extends SessionStates {
  SessionInitial();
}

final class SessionAuthentication extends SessionStates {
  final bool logged;
  final String? accessToken;
  final String? email;
  final String? phone;
  final String? name;
  final String? imageUrl;
  final List<RoleEntity>? roles;

  SessionAuthentication({
    required this.logged,
    required this.accessToken,
    required this.email,
    required this.phone,
    required this.name,
    required this.imageUrl,
    required this.roles,
  });
}
