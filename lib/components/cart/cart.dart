import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_flutter_app/components/cart/cart_items_list.dart';
import 'package:shop_flutter_app/models/product.dart';

/// This is the stateless widget that the main application instantiates.
class Cart extends StatelessWidget {
  final double height;
  final double padding = 8;

  const Cart({
    Key? key,
    required this.height,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Корзина',
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(
                height: 16,
              ),
              Flexible(child: CartItemList(height: height, padding: 0)),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      primary: Colors.black,
                    ),
                    onPressed: () {},
                    child: const Text('Оформить заказ'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
