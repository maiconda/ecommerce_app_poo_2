import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';
import 'package:ecommerce_app/app/core/mixins/dialog_mixins.dart';
import 'package:ecommerce_app/app/core/widgets/category_widget.dart';
import 'package:ecommerce_app/app/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:ecommerce_app/app/features/product/presentation/bloc/product/product_events.dart';
import 'package:ecommerce_app/app/features/product/presentation/bloc/product/product_states.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_bloc.dart';
import 'package:ecommerce_app/app/features/session/presentation/bloc/session/session_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/routes/routes_manager.dart';

class ProductPage extends StatefulWidget {
  final ProductDataEntity productData;

  const ProductPage({
    super.key,
    required this.productData,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with DialogMixins {
  final _productBloc = GetIt.I<ProductBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => _productBloc,
      child: BlocListener<ProductBloc, ProductStates>(
        listenWhen: (previous, current) => current is AddProductToCartLoadFailure || current is AddProductToCartLoadSuccess,
        listener: (context, state) {
          if(state is AddProductToCartLoadSuccess){
            showSuccessDialog(
              context: context,
              message: 'Produto adicionado ao carrinho',
              dismissible: false,
            );
          }
          if(state is AddProductToCartLoadFailure){
            showFailureDialog(
              context: context,
              message: 'Erro ao adicionar produto ao carrinho',
              dismissible: false,
            );
          }
        },
        child: BlocBuilder<SessionBloc, SessionStates>(
          buildWhen: (previous, current) => current is SessionAuthentication,
          builder: (context, state) {
            if (state is SessionAuthentication) {
              return SafeArea(
                child: Scaffold(
                  body: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.only(bottom: 80),
                            // Add padding to avoid content being hidden behind the button
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 350,
                                  color: Colors.red,
                                  child: Image.network(
                                    widget.productData.image,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                                : null,
                                          ),
                                        );
                                      }
                                    },
                                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                      return  Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: const BoxDecoration(
                                          color: Colors.redAccent,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.error,
                                            size: 120,
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'RS${widget.productData.price.toString()}',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        widget.productData.name,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        height: 1,
                                        width: double.infinity,
                                        color: Colors.black.withOpacity(0.7),
                                        margin: const EdgeInsets.only(
                                            bottom: 18, top: 14),
                                      ),
                                      Text(
                                        widget.productData.description,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black.withOpacity(0.65),
                                        ),
                                      ),
                                      GridView.builder(
                                        shrinkWrap: true,
                                        padding:
                                            EdgeInsets.only(top: 20, bottom: 0),
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                        ),
                                        itemCount:
                                            widget.productData.categories.length,
                                        itemBuilder: (context, index) {
                                          return CategoryWidget(
                                              categoryEntity: widget
                                                  .productData.categories[index]);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        left: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              if(state.logged == true){
                              _productBloc.add(AddProductToCartTriggered(
                                  id: widget.productData.id,
                                  accessToken: state.accessToken!));
                              } else if (state.logged == false) {
                                Navigator.push(
                                  context,
                                  RoutesManager.generateRoute(
                                    RouteSettings(
                                      name: RoutesManager.logInPage,
                                      arguments: state.accessToken,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text('Adicionar ao Carrinho'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
