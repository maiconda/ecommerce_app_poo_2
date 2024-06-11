import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/category_entity.dart';

import '../../../../../core/error/failures.dart';
import '../../repositories/get_categories/get_categories_repository.dart';
import 'get_categories_usecase.dart';

class GetCategoriesUseCaseImp implements GetCategoriesUseCase {
  final GetCategoriesRepository getCategoriesRepository;

  GetCategoriesUseCaseImp({required this.getCategoriesRepository});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return getCategoriesRepository();
  }
}
