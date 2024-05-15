import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/get_products_data_repository.dart';
import '../data_sources/get_products_data/get_products_data_remote_datasource.dart';

class GetProductsDataRepositoryImp implements GetProductsDataRepository {
  final GetProductsDataRemoteDatasource getProductsDataRemoteDatasource;

  GetProductsDataRepositoryImp({
    required this.getProductsDataRemoteDatasource,
  });

  @override
  Future<Either<Failure, List<ProductDataEntity>>> call() async {
    return getProductsDataRemoteDatasource();
  }
}
