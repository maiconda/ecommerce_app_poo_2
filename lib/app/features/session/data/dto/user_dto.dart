import 'package:ecommerce_app/app/features/session/data/dto/role_dto.dart';
import 'package:ecommerce_app/app/features/session/domain/entitites/user_entity.dart';

class UserDto extends UserEntity {
  UserDto._({
    required super.accessToken,
    required super.email,
    required super.name,
    required super.phone,
    required super.roles,
    required super.imageUrl
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto._(
      accessToken: json['accessToken'],
      email: json['user']['email'],
      name: json['user']['name'],
      phone: json['user']['phone'],
      imageUrl: json['user']['imgUrl'],
      roles: (json['user']['roles'] as List)
          .map((roleJson) => RoleDto.fromJson(roleJson))
          .toList(),
    );
  }
}
