import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';
import 'package:ecommerce_app/app/features/cart/domain/entities/cart_entity.dart';

import '../../../../../core/error/failures.dart';

abstract interface class BuyCartRemoteDatasource {
  Future<Either<Failure, int>> call({
    required String accessToken,
  });
}
