import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';

import '../../../../core/error/failures.dart';

abstract interface class GetProductsDataRepository{
  Future<Either<Failure, List<ProductDataEntity>>> call();
}
