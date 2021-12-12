import 'package:flutter/material.dart';
import 'package:shop_flutter_app/components/product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: const SafeArea(
        child: Text("Cart")
      ),
    );
  }
}
