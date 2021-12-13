import 'package:flutter/material.dart';
import 'package:shop_flutter_app/components/cart/cart_items_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Корзина',
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(child: CartItemList()),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.black,
                ),
                onPressed: () {},
                child: const Text('Оформить заказ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
