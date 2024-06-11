import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/app/core/entities/category_entity.dart';
import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';
import 'package:ecommerce_app/app/features/product/data/dto/category_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../core/error/failures.dart';
import '../../../../product/data/dto/product_data_dto.dart';
import '../../../domain/enums/search_type_enum.dart';
import 'get_search_remote_datasource.dart';
import 'dart:developer' as developer;

class GetSearchRestDatasource implements GetSearchRemoteDatasource {
  final Dio dio;

  GetSearchRestDatasource({required this.dio});

  @override
  Future<Either<Failure, List<ProductDataEntity>>> call({
    required SearchTypeEnum searchType,
    required int? categoryId,
    required String? semantic,
  }) async {
    final String? url = dotenv.env['MODO'];
    if (url == null) {
      developer.log('URL is not defined in .env');
      return Left(ServerFailure());
    }
    try {
      if (searchType == SearchTypeEnum.semantic) {
        developer.log('semantica');
        Response response = await dio.get(
          '$url/products/search',
          data: {
            'st': semantic!,
          },
        );
        developer.log(response.data.toString());
        List<dynamic> data = response.data;
        List<ProductDataEntity> products = data
            .map((product) => ProductDataDto.fromJson(product))
            .toList();
        return Right(products);
      } else if (searchType == SearchTypeEnum.category) {
        developer.log('categoria');
        Response response = await dio.get(
          '$url/categories/products/$categoryId',
        );
        List<dynamic> data = response.data;
        List<ProductDataEntity> products = data
            .map((product) => ProductDataDto.fromJson(product))
            .toList();
        return Right(products);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
