import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';

import '../../../../core/error/failures.dart';
import '../../domain/enums/search_type_enum.dart';
import '../../domain/repositories/get_search/get_search_repository.dart';
import '../data_sources/get_search/get_search_remote_datasource.dart';

class GetSearchRepositoryImp implements GetSearchRepository {
  final GetSearchRemoteDatasource getSearchRemoteDatasource;

  GetSearchRepositoryImp({
    required this.getSearchRemoteDatasource,
  });

  @override
  Future<Either<Failure, List<ProductDataEntity>>> call({
    required SearchTypeEnum searchType,
    required int? categoryId,
    required String? semantic,
}) async {
    return getSearchRemoteDatasource(
      semantic: semantic,
      searchType: searchType,
      categoryId: categoryId,
    );
  }
}
