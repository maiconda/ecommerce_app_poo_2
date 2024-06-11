import 'package:ecommerce_app/app/features/session/domain/entitites/role_entity.dart';

class UserEntity {
  final String accessToken;
  final String name;
  final String email;
  final String phone;
  final String? imageUrl;
  final List<RoleEntity> roles;

  UserEntity({
    required this.accessToken,
    required this.name,
    required this.email,
    required this.phone,
    required this.roles,
    required this.imageUrl,
  });
}
