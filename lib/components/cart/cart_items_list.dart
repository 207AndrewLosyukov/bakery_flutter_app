import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/cart_product.dart';
import 'package:shop_flutter_app/models/product.dart';
import 'package:shop_flutter_app/redux/cart_page/state.dart';
import 'package:shop_flutter_app/redux/cart_page/thunk.dart';
import 'package:shop_flutter_app/redux/state.dart';
import 'cart_item.dart';

class CartItemList extends StatefulWidget {
  final double height;
  final double padding;

  const CartItemList({
    Key? key,
    required this.height,
    required this.padding,
  }) : super(
          key: key,
        );

  @override
  _CartItemListState createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  void _increaseCounter(int index) {
    Dependencies.instance.store.dispatch(IncreaseNumberOfProducts(index));
  }

  void _decreaseCounter(int index) {
    Dependencies.instance.store.dispatch(DecreaseNumberOfProducts(index));
  }

  void _removeItem(int index) {
    // if (amounts[index] == 0) {
    //   amounts.removeAt(index);
    // }
  }

  Widget _getItem(int index, List<CartProduct> items) {
    return CartItem(
        onAmountDecreased: _decreaseCounter,
        onAmountIncreased: _increaseCounter,
        index: index,
        data: CartProduct(
            amount: items[index].amount,
            product: Product(
              title: items[index].product.title,
              tags: [],
              imageUrl: items[index].product.imageUrl,
              price: items[index].product.price,
              id: '',
            )));
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
                  padding: EdgeInsets.all(widget.padding),
                  itemCount: state.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _getItem(index, state.items);
                  }),
            );
          }
        });
  }
}
