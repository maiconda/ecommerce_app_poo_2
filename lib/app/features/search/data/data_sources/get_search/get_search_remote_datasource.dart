import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/enums/search_type_enum.dart';

abstract interface class GetSearchRemoteDatasource {
  Future<Either<Failure, List<ProductDataEntity>>> call({
    required SearchTypeEnum searchType,
    required int? categoryId,
    required String? semantic,
});
}
