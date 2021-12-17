import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop_flutter_app/components/cart/cart_items_list.dart';
import 'package:shop_flutter_app/models/cart_product.dart';
import 'package:shop_flutter_app/redux/cart_page/state.dart';
import 'package:shop_flutter_app/redux/state.dart';

import '../../dependencies.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  double getSummaryValue(CartPageState state) {
    double result = 0;
    for (CartProduct i in state.items) {
      result += i.amount * i.product.price;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
              const Expanded(child: CartItemList()),
              StoreConnector<GlobalState, CartPageState>(
                  distinct: true,
                  converter: (store) => store.state.cartPage,
                  builder: (context, state) {
                    return Text(
                      ' Итого: \$${getSummaryValue(state)}',
                      style: const TextStyle(fontSize: 24),
                    );
                  }),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.black,
                ),
                onPressed: () {
                  Dependencies.instance.navigator.openOrder();
                },
                child: const Text('Оформить заказ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
