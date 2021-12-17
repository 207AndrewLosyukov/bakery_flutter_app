import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/cart_product.dart';
import 'package:shop_flutter_app/redux/cart_page/state.dart';
import 'package:shop_flutter_app/redux/cart_page/thunk.dart';
import 'package:shop_flutter_app/redux/state.dart';
import 'cart_item.dart';

class CartItemList extends StatefulWidget {
  const CartItemList({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  _CartItemListState createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  void _increaseCounter(String id) {
    Dependencies.instance.store.dispatch(IncreaseNumberOfProducts(id));
  }

  void _decreaseCounter(String id) {
    Dependencies.instance.store.dispatch(DecreaseNumberOfProducts(id));
  }

  Widget _getItem(int index, List<CartProduct> items) {
    return CartItem(
      onAmountDecreased: _decreaseCounter,
      onAmountIncreased: _increaseCounter,
      id: items[index].product.id,
      data: items[index],
    );
  }

  int getTotalPrice() {
    throw UnimplementedError('From db');
  }

  int size() {
    throw UnimplementedError('From db');
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, CartPageState>(
      distinct: true,
      converter: (store) => store.state.cartPage,
      builder: (context, state) {
        if (state.items.isEmpty) {
          return const Text('Корзина пустая!');
        } else {
          return SizedBox(
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: state.items.length,
              itemBuilder: (BuildContext context, int index) {
                return _getItem(index, state.items);
              },
            ),
          );
        }
      },
    );
  }
}
