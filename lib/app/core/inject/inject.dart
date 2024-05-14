import 'package:ecommerce_app/app/features/home/data/data_sources/get_products_data/get_products_data_remote_datasource.dart';
import 'package:ecommerce_app/app/features/home/data/data_sources/get_products_data/get_products_data_rest_datasource.dart';
import 'package:ecommerce_app/app/features/home/domain/repositories/get_products_data_repository.dart';
import 'package:ecommerce_app/app/features/home/domain/use_cases/get_products_data/get_products_data_usecase.dart';
import 'package:ecommerce_app/app/features/home/domain/use_cases/get_products_data/get_products_data_usecase_imp.dart';
import 'package:ecommerce_app/app/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repositories/get_products_data_repository_imp.dart';
import '../services/connection/connection_plus_service.dart';
import '../services/connection/connection_service.dart';

import 'dart:developer' as developer;

class Inject {
  static Future<void> init() async {
    final getIt = GetIt.instance;

    developer.log('injetando');

    getIt
      ///Services
      ..registerLazySingleton<ConnectionService>(ConnectionPlusService.new)

      ///Datasources
      ..registerLazySingleton<GetProductsDataRemoteDatasource>(
        () => GetProductsDataRestDatasource(),
      )

      ///Repositories
      ..registerLazySingleton<GetProductsDataRepository>(
        () => GetProductsDataRepositoryImp(
          getProductsDataRemoteDatasource: getIt(),
        ),
      )

      ///UseCases
      ..registerLazySingleton<GetProductsDataUsecase>(
        () => GetProductsDataUsecaseImp(
          getProductsDataRepository: getIt(),
        ),
      )

      ///Controllers
      ..registerFactory<HomeBloc>(
        () => HomeBloc(
          getHomeDataUsecase: getIt(),
        ),
      );
  }
}
