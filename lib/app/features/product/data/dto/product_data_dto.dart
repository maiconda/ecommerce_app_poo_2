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

  factory ProductDataDto.fromJson({
    required dynamic json,
  }) {
    return ProductDataDto._(
      categories: (json['categories'] as List)
          .map((typeJson) => CategoryDto.fromJson(json: typeJson))
          .toList(),
      description: json['desciption'],
      id: json['id'],
      image:
          'https://t2.tudocdn.net/601612?w=1920',
      // image: json['imgUrl'],
      name: json['name'],
      price: json['price'],
    );
  }

  static List<ProductDataDto> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductDataDto.fromJson(json: json)).toList();
  }
}
