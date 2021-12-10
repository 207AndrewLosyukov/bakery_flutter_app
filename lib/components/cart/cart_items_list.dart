import 'package:flutter/material.dart';
import 'package:shop_flutter_app/models/product.dart';

import 'cart_fake_data.dart';
import 'cart_item.dart';

class CartItemList extends StatefulWidget {
  final double height;
  const CartItemList({
    Key? key,
    required this.height,
  }) : super(
          key: key,
        );

  @override
  _CartItemListState createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  void _increaseCounter(int index) {
    setState(() {
      ++amounts[index];
    });
  }

  void _decreaseCounter(int index) {
    setState(() {
      --amounts[index];
      if (amounts[index] == 0) {
        _removeItem(index);
      }
    });
  }

  void _removeItem(int index) {
    if (amounts[index] == 0) {
      amounts.removeAt(index);
    }
  }

  Widget _getItem(int index) {
    return CartItem(
        onAmountDecreased: _decreaseCounter,
        onAmountIncreased: _increaseCounter,
        index: index,
        amount: amounts[index],
        data: Product(
          title: titles[index],
          tags: [],
          imageUrl: images[index],
          price: prices[index],
          id: '',
        ));
  }

  int getTotalPrice() {
    throw UnimplementedError('From db');
  }

  int size() {
    throw UnimplementedError('From db');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: amounts.length,
          itemBuilder: (BuildContext context, int index) {
            return _getItem(index);
          }),
    );
  }
}
