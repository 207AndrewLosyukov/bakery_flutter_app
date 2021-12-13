import 'package:flutter/material.dart';
import 'package:shop_flutter_app/models/product.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.orange[100],
        child: const SafeArea(child: Center(child: Text("Product"))),
      ),
    );
  }
}
