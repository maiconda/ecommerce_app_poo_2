import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../../../core/error/failures.dart';
import '../../dto/product_data_dto.dart';
import 'remove_product_to_cart_remote_datasource.dart';
import 'dart:developer' as developer;

class RemoveProductToCartRestDatasource implements RemoveProductToCartRemoteDatasource {
  final Dio dio;

  RemoveProductToCartRestDatasource({required this.dio});

  @override
  Future<Either<Failure, int>> call({
    required int id,
    required String accessToken,
}) async {
    final String? url = dotenv.env['MODO'];
    if (url == null) {
      developer.log('URL is not defined in .env');
      return Left(ServerFailure());
    }
    try {
      Response response = await dio.get(
        '$url/products',
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<ProductDataEntity> products = data
            .map((product) => ProductDataDto.fromJson(product))
            .toList();
        return Right(0);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
