import '../../domain/entitites/role_entity.dart';

class RoleDto extends RoleEntity {
  RoleDto({
    required super.id,
    required super.name,
  });

  factory RoleDto.fromJson(Map<String, dynamic> json) {
    return RoleDto(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}