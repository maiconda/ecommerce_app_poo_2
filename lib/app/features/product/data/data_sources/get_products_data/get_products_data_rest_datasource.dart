import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/api_client.dart';
import '../../dto/product_data_dto.dart';
import 'get_products_data_remote_datasource.dart';

class GetProductsDataRestDatasource
    implements GetProductsDataRemoteDatasource {

  final ApiClient client;

  GetProductsDataRestDatasource({
    required this.client,
});

  @override
  Future<Either<Failure, List<ProductDataEntity>>> call() async {
    try {
      final response = await client.get('/products');
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
        final List<ProductDataDto> productList = ProductDataDto.fromJsonList(jsonList);
        return Right(productList);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
