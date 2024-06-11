import 'package:ecommerce_app/app/core/entities/category_entity.dart';

class CategoryDto extends CategoryEntity {
  CategoryDto._({
    required int id,
    required String name,
    required String? imgUrl,
  }) : super(
    name: name,
    id: id,
    imageUrl: imgUrl,
  );

  factory CategoryDto.fromJson({
    required dynamic json,
  }) {
    return CategoryDto._(
      id: json['id'],
      name: json['name'],
      imgUrl: json['imgUrl']
    );
  }
}
