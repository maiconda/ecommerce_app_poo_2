import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/app/core/entities/category_entity.dart';
import 'package:ecommerce_app/app/features/product/data/dto/category_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../core/error/failures.dart';
import 'get_categories_remote_datasource.dart';
import 'dart:developer' as developer;

class GetCategoriesRestDatasource implements GetCategoriesRemoteDatasource {
  final Dio dio;

  GetCategoriesRestDatasource({required this.dio});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    final String? url = dotenv.env['MODO'];
    if (url == null) {
      developer.log('URL is not defined in .env');
      return Left(ServerFailure());
    }
    try {
      Response response = await dio.get(
        '$url/categories',
      );
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> responseData =
            List<Map<String, dynamic>>.from(response.data);
        List<CategoryEntity> categories = responseData
            .map((categoryJson) => CategoryDto.fromJson(json: categoryJson))
            .toList();
        return Right(categories);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
