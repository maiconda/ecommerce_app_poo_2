import 'package:ecommerce_app/app/core/mixins/confirmation_mixin.dart';
import 'package:ecommerce_app/app/core/mixins/dialog_mixins.dart';
import 'package:ecommerce_app/app/features/cart/presentation/bloc/cart_events.dart';
import 'package:ecommerce_app/app/features/cart/presentation/bloc/cart_states.dart';
import 'package:ecommerce_app/app/features/cart/presentation/ui/widgets/product_cart_widget.dart';
import 'package:ecommerce_app/app/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:ecommerce_app/app/features/product/presentation/bloc/product/product_events.dart';
import 'package:ecommerce_app/app/features/product/presentation/bloc/product/product_states.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_bloc.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/entities/formated_cart_entity.dart';
import '../../bloc/cart_bloc.dart';

import 'dart:developer' as developer;

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with ConfirmationMixin, DialogMixins {
  final _cartBloc = GetIt.I<CartBloc>();
  final _productBloc = GetIt.I<ProductBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionStates>(
      buildWhen: (previous, current) => current is SessionAuthentication,
      builder: (context, state) {
        if (state is SessionAuthentication) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<CartBloc>(
                create: (context) => _cartBloc
                  ..add(
                    CartTriggered(state.accessToken!),
                  ),
              ),
              BlocProvider<ProductBloc>(create: (context) => _productBloc)
            ],
            child: MultiBlocListener(
              listeners: [
                BlocListener<CartBloc, CartStates>(
                  listenWhen: (previous, current) => current is CartLoadSuccess,
                  listener: (context, listenerState) {
                    if (listenerState is CartLoadSuccess) {
                      _cartBloc.add(CartFormatTriggered(
                        cartProducts: listenerState.cartProducts,
                      ));
                    }
                  },
                ),
                BlocListener<CartBloc, CartStates>(
                  listenWhen: (previous, current) =>
                      current is BuyCartLoadSuccess ||
                      current is BuyCartLoadFailure,
                  listener: (context, listenerState) {
                    if (listenerState is BuyCartLoadSuccess) {
                      developer.log('message');
                      _cartBloc.add(
                        CartTriggered(state.accessToken!),
                      );
                      showSuccessDialog(
                        context: context,
                        message: 'Compra finalizada com sucesso',
                        dismissible: false,
                      );
                    }
                    if (listenerState is BuyCartLoadFailure) {
                      _cartBloc.add(
                        CartTriggered(state.accessToken!),
                      );
                      showFailureDialog(
                        context: context,
                        message: 'Erro ao finalizar compra',
                        dismissible: false,
                      );
                    }
                  },
                ),
                BlocListener<ProductBloc, ProductStates>(
                  listenWhen: (previous, current) =>
                      current is AddProductToCartLoadSuccess ||
                      current is RemoveProductToCartLoadSuccess,
                  listener: (context, listenerState) {
                    if (listenerState is AddProductToCartLoadSuccess ||
                        listenerState is RemoveProductToCartLoadSuccess) {
                      _cartBloc.add(
                        CartTriggered(state.accessToken!),
                      );
                    }
                  },
                )
              ],
              child: BlocBuilder<CartBloc, CartStates>(
                buildWhen: (previous, current) =>
                    current is CartLoadSuccess || current is CartFormatted,
                builder: (secondSuccess, secondState) {
                  if (secondState is CartFormatted) {
                    return SafeArea(
                      child: Scaffold(
                        body: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 0),
                                child: const Text(
                                  'Carrinho de Compras',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 0, bottom: 12),
                                child: Text(
                                  '${_getProductLength(cartEntities: secondState.formattedCart)} Items',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                height: 1,
                                width: double.infinity,
                                color: Colors.black.withOpacity(0.7),
                                margin: const EdgeInsets.only(bottom: 17),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ListView.builder(
                                    itemCount: secondState.formattedCart.length,
                                    itemBuilder: (context, index) {
                                      return ProductCartWidget(
                                        add: () {
                                          _productBloc.add(
                                              AddProductToCartTriggered(
                                                  id: secondState
                                                      .formattedCart[index].id,
                                                  accessToken:
                                                      state.accessToken!));
                                        },
                                        remove: () {
                                          _productBloc.add(
                                              RemoveProductToCartTriggered(
                                                  id: secondState
                                                      .formattedCart[index]
                                                      .idToRemove,
                                                  accessToken:
                                                      state.accessToken!));
                                        },
                                        name: secondState
                                            .formattedCart[index].name,
                                        quantity: secondState
                                            .formattedCart[index].quantity,
                                        description: secondState
                                            .formattedCart[index].description,
                                        imgUrl: secondState
                                            .formattedCart[index].imgUrl,
                                        price: secondState
                                            .formattedCart[index].price,
                                        isLast: index ==
                                                secondState
                                                        .formattedCart.length -
                                                    1
                                            ? true
                                            : false,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                padding: const EdgeInsets.only(top: 11.5),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: Colors.black.withOpacity(0.5),
                                      width: .75,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        child: Text(
                                      'Subtotal',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                                    Text(
                                      'RS${_getPrice(cartEntities: secondState.formattedCart)}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: ElevatedButton(
                                      onPressed: secondState.formattedCart.length > 0 ? () {
                                        showConfirmOperationDialog(
                                          context: context,
                                          message:
                                              'Você deseja finalizar sua compra?',
                                          confirmFunction: () {
                                            _cartBloc.add(BuyCartTriggered(
                                                accessToken:
                                                    state.accessToken!));
                                          },
                                          cancelLabel: 'Cancelar',
                                          confirmLabel: 'Comprar',
                                        );
                                      } : null,
                                      child: const Text(
                                        'Finalizar Compra',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      )))
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  double _getPrice({
    required List<FormattedCartEntity> cartEntities,
  }) {
    double tempPrice = 0;

    cartEntities.forEach(
      (element) {
        tempPrice += element.price * element.quantity;
      },
    );

    return tempPrice;
  }

  int _getProductLength({
    required List<FormattedCartEntity> cartEntities,
  }) {
    int tempLength = 0;

    cartEntities.forEach(
      (element) {
        tempLength += element.quantity;
      },
    );
    return tempLength;
  }
}
