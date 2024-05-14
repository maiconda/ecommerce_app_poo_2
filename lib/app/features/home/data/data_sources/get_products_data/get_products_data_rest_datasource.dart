import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';

import '../../../../../core/error/failures.dart';
import 'get_products_data_remote_datasource.dart';
import 'dart:developer' as developer;

class GetProductsDataRestDatasource
    implements GetProductsDataRemoteDatasource {

  GetProductsDataRestDatasource();

  @override
  Future<Either<Failure, List<ProductDataEntity>>> call() async {
    try {
      developer.log('message 1');
      Future.delayed(Duration(seconds: 2));
      return Left(AuthFailure());
    } catch (e, stack) {
      developer.log('message 2');
      Future.delayed(Duration(seconds: 2));
      return Left(ServerFailure());
    }
  }
}
