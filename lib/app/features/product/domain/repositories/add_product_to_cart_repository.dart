import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';

import '../../../../core/error/failures.dart';

abstract interface class AddProductToCartRepository{
  Future<Either<Failure, int>> call({
    required int id,
    required String accessToken,
});
}
