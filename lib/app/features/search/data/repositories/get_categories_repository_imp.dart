import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/category_entity.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/get_categories/get_categories_repository.dart';
import '../data_sources/get_categories/get_categories_remote_datasource.dart';

class GetCategoriesRepositoryImp implements GetCategoriesRepository {
  final GetCategoriesRemoteDatasource getCategoriesRemoteDatasource;

  GetCategoriesRepositoryImp({
    required this.getCategoriesRemoteDatasource,
  });

  @override
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return getCategoriesRemoteDatasource();
  }
}
