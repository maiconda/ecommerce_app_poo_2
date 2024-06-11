import '../../../domain/entitites/role_entity.dart';

sealed class SessionEvents {}

final class SessionAuthenticationChange extends SessionEvents {
  final bool logged;
  final String? accessToken;
  final String? email;
  final String? phone;
  final String? name;
  final String? imageUrl;
  final List<RoleEntity>? roles;

  SessionAuthenticationChange({
    required this.logged,
    required this.accessToken,
    required this.email,
    required this.phone,
    required this.name,
    required this.imageUrl,
    required this.roles,
  });
}

class SessionStarted extends SessionEvents {
  SessionStarted();
}
