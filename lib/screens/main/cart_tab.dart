import 'package:flutter/material.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: const SafeArea(
        child: Center(child: Text("Cart"))
      ),
    );
  }
}
