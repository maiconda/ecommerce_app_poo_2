import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';

import '../../../../../core/error/failures.dart';
import '../../enums/search_type_enum.dart';
import '../../repositories/get_search/get_search_repository.dart';
import 'get_search_usecase.dart';

class GetSearchUseCaseImp implements GetSearchUseCase {
  final GetSearchRepository getSearchRepository;

  GetSearchUseCaseImp({required this.getSearchRepository});

  @override
  Future<Either<Failure, List<ProductDataEntity>>> call({
    required SearchTypeEnum searchType,
    required int? categoryId,
    required String? semantic,
}) async {
    return getSearchRepository(
      categoryId: categoryId,
      searchType: searchType,
      semantic: semantic,
    );
  }
}
