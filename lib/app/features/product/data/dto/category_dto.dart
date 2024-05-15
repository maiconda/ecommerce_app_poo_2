import 'package:ecommerce_app/app/core/entities/category_entity.dart';

class CategoryDto extends CategoryEntity {
  CategoryDto._({
    required int id,
    required String name,
  }) : super(
    name: name,
    id: id,
  );

  factory CategoryDto.fromJson({
    required dynamic json,
  }) {
    return CategoryDto._(
      id: json['id'],
      name: json['name'],
    );
  }
}
