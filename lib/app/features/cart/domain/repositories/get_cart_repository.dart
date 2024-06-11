import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/features/cart/domain/entities/cart_entity.dart';

import '../../../../core/error/failures.dart';

abstract interface class GetCartRepository{
  Future<Either<Failure, List<CartEntity>>> call({
    required String accessToken,
  });
}
