import 'category_entity.dart';

class ProductDataEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  final List<CategoryEntity> categories;

  ProductDataEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.categories,
  });
}
