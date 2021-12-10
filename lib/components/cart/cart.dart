import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_flutter_app/components/cart/cart_items_list.dart';
import 'package:shop_flutter_app/models/product.dart';

/// This is the stateless widget that the main application instantiates.
class Cart extends StatelessWidget {

  const Cart({
    Key? key,
  }) : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: const [
            CartItemList(height = 500),
          ]
      ),
    );
  }
}
