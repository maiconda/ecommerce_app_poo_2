import 'package:ecommerce_app/app/core/entities/category_entity.dart';
import '../../../../core/entities/product_data_entity.dart';
import 'category_dto.dart';

class ProductDataDto extends ProductDataEntity {
  ProductDataDto._({
    required super.categories,
    required super.description,
    required super.id,
    required super.image,
    required super.name,
    required super.price,
  });

  factory ProductDataDto.fromJson(Map<String, dynamic> json) {
    return ProductDataDto._(
      categories: (json['categories'] as List)
          .map((typeJson) => CategoryDto.fromJson(json: typeJson))
          .toList(),
      description: json['desciption'],
      id: json['id'],
      image:
      json['imgUrl'],
      name: json['name'],
      price: json['price'],
    );
  }
}