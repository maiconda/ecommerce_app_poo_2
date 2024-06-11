import 'package:dio/dio.dart';
import 'package:ecommerce_app/app/features/cart/data/data_sources/get_cart/get_cart_remote_datasource.dart';
import 'package:ecommerce_app/app/features/cart/data/data_sources/get_cart/get_cart_rest_remote_datasource.dart';
import 'package:ecommerce_app/app/features/cart/domain/repositories/get_cart_repository.dart';
import 'package:ecommerce_app/app/features/cart/domain/use_cases/get_cart/get_cart_usecase.dart';
import 'package:ecommerce_app/app/features/cart/domain/use_cases/get_cart/get_cart_usecase_imp.dart';
import 'package:ecommerce_app/app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_app/app/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_app/app/features/product/data/data_sources/add_product_to_card/add_product_to_cart_remote_datasource.dart';
import 'package:ecommerce_app/app/features/product/data/repositories/add_product_to_card_repository_imp.dart';
import 'package:ecommerce_app/app/features/product/domain/repositories/add_product_to_cart_repository.dart';
import 'package:ecommerce_app/app/features/product/domain/use_cases/add_product_to_cart_data/add_product_to_cart_usecase.dart';
import 'package:ecommerce_app/app/features/product/domain/use_cases/add_product_to_cart_data/add_product_to_cart_usecase_imp.dart';
import 'package:ecommerce_app/app/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:ecommerce_app/app/features/search/data/data_sources/get_categories/get_categories_remote_datasource.dart';
import 'package:ecommerce_app/app/features/search/data/data_sources/get_categories/get_categories_rest_remote_datasource.dart';
import 'package:ecommerce_app/app/features/search/domain/repositories/get_categories/get_categories_repository.dart';
import 'package:ecommerce_app/app/features/search/domain/use_cases/get_categories/get_categories_usecase.dart';
import 'package:ecommerce_app/app/features/search/domain/use_cases/get_categories/get_categories_usecase_imp.dart';
import 'package:ecommerce_app/app/features/search/presentation/bloc/search/search_bloc.dart';
import 'package:ecommerce_app/app/features/search/presentation/bloc/search_list/search_list_bloc.dart';
import 'package:ecommerce_app/app/features/session/data/data_sources/login/login_remote_datasource.dart';
import 'package:ecommerce_app/app/features/session/data/data_sources/login/login_rest_datasource.dart';
import 'package:ecommerce_app/app/features/session/data/data_sources/sign_in/sign_in_remote_datasource.dart';
import 'package:ecommerce_app/app/features/session/data/data_sources/sign_in/sign_in_rest_datasource.dart';
import 'package:ecommerce_app/app/features/session/data/repositories/login_repository_imp.dart';
import 'package:ecommerce_app/app/features/session/data/repositories/sign_in_repository_imp.dart';
import 'package:ecommerce_app/app/features/session/domain/repositories/login/login_repository.dart';
import 'package:ecommerce_app/app/features/session/domain/repositories/sign_in/sign_in_repository.dart';
import 'package:ecommerce_app/app/features/session/domain/use_cases/login/login_usecase.dart';
import 'package:ecommerce_app/app/features/session/domain/use_cases/login/login_usecase_imp.dart';
import 'package:ecommerce_app/app/features/session/domain/use_cases/sign_in/sign_in_usecase.dart';
import 'package:ecommerce_app/app/features/session/domain/use_cases/sign_in/sign_in_usecase_imp.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/login/login_bloc.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_bloc.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../features/cart/data/repositories/get_cart_repository_imp.dart';
import '../../features/initial_page/presentation/bloc/initial_page_bloc.dart';
import '../../features/product/data/data_sources/add_product_to_card/add_product_to_cart_rest_datasource.dart';
import '../../features/product/data/data_sources/get_products_data/get_products_data_remote_datasource.dart';
import '../../features/product/data/data_sources/get_products_data/get_products_data_rest_datasource.dart';
import '../../features/product/data/data_sources/remove_product_to_card/remove_product_to_cart_remote_datasource.dart';
import '../../features/product/data/data_sources/remove_product_to_card/remove_product_to_cart_rest_datasource.dart';
import '../../features/product/data/repositories/get_products_data_repository_imp.dart';
import '../../features/product/data/repositories/remove_product_to_card_repository_imp.dart';
import '../../features/product/domain/repositories/get_products_data_repository.dart';
import '../../features/product/domain/repositories/remove_product_to_cart_repository.dart';
import '../../features/product/domain/use_cases/get_products_data/get_products_data_usecase.dart';
import '../../features/product/domain/use_cases/get_products_data/get_products_data_usecase_imp.dart';
import '../../features/product/domain/use_cases/remove_product_to_cart_data/remove_product_to_cart_usecase.dart';
import '../../features/product/domain/use_cases/remove_product_to_cart_data/remove_product_to_cart_usecase_imp.dart';
import '../../features/search/data/data_sources/get_search/get_search_remote_datasource.dart';
import '../../features/search/data/data_sources/get_search/get_search_rest_remote_datasource.dart';
import '../../features/search/data/repositories/get_categories_repository_imp.dart';
import '../../features/search/data/repositories/get_search_repository_imp.dart';
import '../../features/search/domain/repositories/get_search/get_search_repository.dart';
import '../../features/search/domain/use_cases/get_search/get_search_usecase.dart';
import '../../features/search/domain/use_cases/get_search/get_search_usecase_imp.dart';
import '../../features/session/data/data_sources/admin_sign_in/admin_sign_in_remote_datasource.dart';
import '../../features/session/data/data_sources/admin_sign_in/admin_sign_in_rest_datasource.dart';
import '../../features/session/data/repositories/admin_sign_in_repository_imp.dart';
import '../../features/session/domain/repositories/admin_sign_in/admin_sign_in_repository.dart';
import '../../features/session/domain/use_cases/admin_sign_in/admin_sign_in_usecase.dart';
import '../../features/session/domain/use_cases/admin_sign_in/admin_sign_in_usecase_imp.dart';
import '../../features/session/presentation/bloc/admin_sign_in/admin_sign_in_bloc.dart';
import '../services/connection/connection_plus_service.dart';
import '../services/connection/connection_service.dart';

class Inject {
  static Future<void> init() async {
    final getIt = GetIt.instance;
    getIt

      /// Services
      ..registerLazySingleton<ConnectionService>(ConnectionPlusService.new)

      /// Data Sources
      ..registerLazySingleton<GetProductsDataRemoteDatasource>(
        () => GetProductsDataRestDatasource(
          dio: Dio(),
        ),
      )
      ..registerLazySingleton<SignInRemoteDatasource>(
        () => SignInRestDatasource(
          dio: Dio(),
        ),
      )
      ..registerLazySingleton<AdminSignInRemoteDatasource>(
        () => AdminSignInRestDatasource(
          dio: Dio(),
        ),
      )
      ..registerLazySingleton<LoginRemoteDatasource>(
        () => LoginRestDatasource(
          dio: Dio(),
        ),
      )
      ..registerLazySingleton<GetCategoriesRemoteDatasource>(
        () => GetCategoriesRestDatasource(
          dio: Dio(),
        ),
      )
      ..registerLazySingleton<GetSearchRemoteDatasource>(
        () => GetSearchRestDatasource(
          dio: Dio(),
        ),
      )
      ..registerLazySingleton<AddProductToCartRemoteDatasource>(
            () => AddProductToCartRestDatasource(
          dio: Dio(),
        ),
      )
      ..registerLazySingleton<RemoveProductToCartRemoteDatasource>(
            () => RemoveProductToCartRestDatasource(
          dio: Dio(),
        ),
      )
      ..registerLazySingleton<GetCartRemoteDatasource>(
            () => GetCartRestDatasource(
          dio: Dio(),
        ),
      )

      /// Repositories
      ..registerLazySingleton<GetProductsDataRepository>(
        () => GetProductsDataRepositoryImp(
            getProductsDataRemoteDatasource: getIt()),
      )
      ..registerLazySingleton<SignInRepository>(
        () => SignInRepositoryImp(signInRemoteDatasource: getIt()),
      )
      ..registerLazySingleton<AdminSignInRepository>(
        () => AdminSignInRepositoryImp(adminSignInRemoteDatasource: getIt()),
      )
      ..registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImp(loginRemoteDatasource: getIt()),
      )
      ..registerLazySingleton<GetCategoriesRepository>(
        () =>
            GetCategoriesRepositoryImp(getCategoriesRemoteDatasource: getIt()),
      )
      ..registerLazySingleton<GetSearchRepository>(
        () => GetSearchRepositoryImp(getSearchRemoteDatasource: getIt()),
      )
      ..registerLazySingleton<AddProductToCartRepository>(
            () => AddProductToCartRepositoryImp(addProductToCartRemoteDatasource: getIt()),
      )
      ..registerLazySingleton<RemoveProductToCartRepository>(
            () => RemoveProductToCartRepositoryImp(removeProductToCartRemoteDatasource: getIt()),
      )
      ..registerLazySingleton<GetCartRepository>(
            () => GetCartRepositoryImp(getCartRemoteDatasource: getIt()),
      )

      /// UseCases
      ..registerLazySingleton<GetProductsDataUsecase>(
        () => GetProductsDataUsecaseImp(
          getProductsDataRepository: getIt(),
        ),
      )
      ..registerLazySingleton<SignInUseCase>(
        () => SignInUseCaseImp(
          signInRepository: getIt(),
        ),
      )
      ..registerLazySingleton<AdminSignInUseCase>(
        () => AdminSignInUseCaseImp(
          adminSignInRepository: getIt(),
        ),
      )
      ..registerLazySingleton<LoginUseCase>(
        () => LoginUseCaseImp(
          loginRepository: getIt(),
        ),
      )
      ..registerLazySingleton<GetCategoriesUseCase>(
        () => GetCategoriesUseCaseImp(
          getCategoriesRepository: getIt(),
        ),
      )
      ..registerLazySingleton<GetSearchUseCase>(
        () => GetSearchUseCaseImp(
          getSearchRepository: getIt(),
        ),
      )
      ..registerLazySingleton<AddProductToCartUseCase>(
            () => AddProductToCartUseCaseImp(
          addProductToCartRepository: getIt(),
        ),
      )
      ..registerLazySingleton<RemoveProductToCartUseCase>(
            () => RemoveProductToCartUseCaseImp(
          removeProductToCartRepository: getIt(),
        ),
      )
      ..registerLazySingleton<GetCartUseCase>(
            () => GetCartUseCaseImp(
          getCartRepository: getIt(),
        ),
      )

      /// Controllers
      ..registerFactory<HomeBloc>(
        () => HomeBloc(getProductsDataUsecase: getIt()),
      )
      ..registerFactory<SessionBloc>(
        () => SessionBloc(),
      )
      ..registerFactory<LoginBloc>(
        () => LoginBloc(
          loginUseCase: getIt(),
        ),
      )
      ..registerFactory<SignInBloc>(
        () => SignInBloc(
          signInUseCase: getIt(),
        ),
      )
      ..registerFactory<AdminSignInBloc>(
        () => AdminSignInBloc(
          adminSignInUseCase: getIt(),
        ),
      )
      ..registerFactory<SearchBloc>(
        () => SearchBloc(
          getCategoriesUseCase: getIt(),
        ),
      )
      ..registerFactory<SearchListBloc>(
        () => SearchListBloc(
          getSearchUseCase: getIt(),
        ),
      )
      ..registerFactory<ProductBloc>(
        () => ProductBloc(
          addProductToCartUseCase: getIt(),
          removeProductToCartUseCase: getIt(),
        ),
      )
      ..registerFactory<CartBloc>(
            () => CartBloc(
          getCartUseCase: getIt(),
        ),
      )
      ..registerFactory<InitialPageBloc>(() => InitialPageBloc());
  }
}
