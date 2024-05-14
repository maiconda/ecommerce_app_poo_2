import 'package:dartz/dartz.dart';

import '../../../../../core/entities/product_data_entity.dart';
import '../../../../../core/error/failures.dart';
import '../../repositories/get_products_data_repository.dart';
import 'get_products_data_usecase.dart';

class GetProductsDataUsecaseImp implements GetProductsDataUsecase{
  final GetProductsDataRepository getProductsDataRepository;

  GetProductsDataUsecaseImp({required this.getProductsDataRepository});

  @override
  Future<Either<Failure, List<ProductDataEntity>>> call() async {
    return getProductsDataRepository();
  }
}