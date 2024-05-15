import 'package:ecommerce_app/app/core/entities/product_data_entity.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final ProductDataEntity productData;

  const ProductPage({
    super.key,
    required this.productData,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: Text(
        widget.productData.name
      ),
    );
  }
}
