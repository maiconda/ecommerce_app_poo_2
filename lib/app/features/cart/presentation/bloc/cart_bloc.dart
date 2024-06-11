import 'package:ecommerce_app/app/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_app/app/features/cart/domain/entities/formated_cart_entity.dart';
import 'package:ecommerce_app/app/features/search/presentation/bloc/search/search_events.dart';
import 'package:ecommerce_app/app/features/search/presentation/bloc/search/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_cart/get_cart_usecase.dart';
import 'cart_events.dart';
import 'cart_states.dart';

import 'dart:developer' as developer;

class CartBloc extends Bloc<CartEvents, CartStates> {
  final GetCartUseCase getCartUseCase;

  CartBloc({required this.getCartUseCase}) : super(CartInitial()) {
    on<CartTriggered>((event, emit) async {
      developer.log('filho da pouta');
      emit(CartLoadProgress());
      final getCartUseResult =
          await getCartUseCase(accessToken: event.accessToken);

      getCartUseResult.fold(
        (failure) => {
          emit(CartLoadFailure(failure: failure)),
        },
        (success) => {
          emit(
            CartLoadSuccess(
              cartProducts: success,
            ),
          ),
        },
      );
    });

    on<CartFormatTriggered>((event, emit) async {
      List<CartEntity> tempCart = event.cartProducts;
      List<FormattedCartEntity> tempFormattedCart = [];

      for (var element in tempCart) {
        var haveElement = false;
        for (var secondElement in tempFormattedCart) {
          if (element.product.name == secondElement.name) {
            haveElement = true;
            secondElement = FormattedCartEntity(
              name: secondElement.name,
              quantity: secondElement.quantity + 1,
              price: secondElement.price + element.product.price,
              description: secondElement.description,
              imgUrl: secondElement.imgUrl,
            );
            break;
          }
        }
        if (!haveElement) {
          tempFormattedCart.add(FormattedCartEntity(
            name: element.product.name,
            quantity: 1,
            price: element.product.price,
            description: element.product.description,
            imgUrl: element.product.image,
          ));
        }

        emit(CartFormatted(formattedCart: tempFormattedCart));
      }
    });
  }
}
