import 'package:ecommerce_app/app/core/entities/category_entity.dart';
import 'package:ecommerce_app/app/features/search/domain/enums/search_type_enum.dart';
import 'package:flutter/material.dart';

import '../routes/routes_manager.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryEntity categoryEntity;

  const CategoryWidget({
    super.key,
    required this.categoryEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          RoutesManager.generateRoute(
            RouteSettings(
              name: RoutesManager.searchListPage,
              arguments: [
                SearchTypeEnum.category,
                categoryEntity.id,
                null,
              ],
            ),
          ),
        );
      },
      child: SizedBox(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12.5),
              ),
            ),
            Stack(
              children: [
                Center(
                  child: Text(
                    categoryEntity.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
