import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/category_entity.dart';

import '../../../../../core/error/failures.dart';

abstract interface class GetCategoriesRemoteDatasource {
  Future<Either<Failure, List<CategoryEntity>>> call();
}
