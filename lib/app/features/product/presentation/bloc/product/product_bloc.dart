import 'package:ecommerce_app/app/features/product/presentation/bloc/product/product_events.dart';
import 'package:ecommerce_app/app/features/product/presentation/bloc/product/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/add_product_to_cart_data/add_product_to_cart_usecase.dart';
import '../../../domain/use_cases/remove_product_to_cart_data/remove_product_to_cart_usecase.dart';

class ProductBloc extends Bloc<ProductEvents, ProductStates> {
  final RemoveProductToCartUseCase removeProductToCartUseCase;
  final AddProductToCartUseCase addProductToCartUseCase;

  ProductBloc(
      {required this.removeProductToCartUseCase,
      required this.addProductToCartUseCase})
      : super(ProductInitial()) {
    on<AddProductToCartTriggered>((event, emit) async {
      emit(AddProductToCartLoadProgress());
      final addProductToCartResult = await addProductToCartUseCase(
        id: event.id,
        accessToken: event.accessToken,
      );
      addProductToCartResult.fold(
            (failure) => {
          emit(AddProductToCartLoadFailure(failure: failure)),
        },
            (success) => {
          emit(
            AddProductToCartLoadSuccess(),
          ),
        },
      );
    });

    on<RemoveProductToCartTriggered>((event, emit) async {
      emit(RemoveProductToCartLoadProgress());
      final removeProductToCartResult = await removeProductToCartUseCase(
        id: event.id,
        accessToken: event.accessToken,
      );
      removeProductToCartResult.fold(
            (failure) => {
          emit(AddProductToCartLoadFailure(failure: failure)),
        },
            (success) => {
          emit(
            AddProductToCartLoadSuccess(),
          ),
        },
      );
    });
  }
}
