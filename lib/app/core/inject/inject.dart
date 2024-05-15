import 'package:ecommerce_app/app/core/network/api_client.dart';
import 'package:ecommerce_app/app/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_app/app/features/inital_page/presentation/bloc/initial_page_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../../features/product/data/data_sources/get_products_data/get_products_data_remote_datasource.dart';
import '../../features/product/data/data_sources/get_products_data/get_products_data_rest_datasource.dart';
import '../../features/product/data/repositories/get_products_data_repository_imp.dart';
import '../../features/product/domain/repositories/get_products_data_repository.dart';
import '../../features/product/domain/use_cases/get_products_data/get_products_data_usecase.dart';
import '../../features/product/domain/use_cases/get_products_data/get_products_data_usecase_imp.dart';
import '../services/connection/connection_plus_service.dart';
import '../services/connection/connection_service.dart';

class Inject {
  static Future<void> init() async {
    final getIt = GetIt.instance;
    getIt

      /// Services
      ..registerLazySingleton<ConnectionService>(ConnectionPlusService.new)
      ..registerLazySingleton(() => http.Client())
      ..registerLazySingleton(() => ApiClient(client: getIt()))

      /// Data Sources
      ..registerLazySingleton<GetProductsDataRemoteDatasource>(
        () => GetProductsDataRestDatasource(client: getIt()),
      )

      /// Repositories
      ..registerLazySingleton<GetProductsDataRepository>(
        () => GetProductsDataRepositoryImp(
            getProductsDataRemoteDatasource: getIt()),
      )

      /// UseCases
      ..registerLazySingleton<GetProductsDataUsecase>(
        () => GetProductsDataUsecaseImp(getProductsDataRepository: getIt()),
      )

      /// Controllers
      ..registerFactory<HomeBloc>(
        () => HomeBloc(getProductsDataUsecase: getIt()),
      )
      ..registerFactory<InitialPageBloc>(() => InitialPageBloc());
  }
}
