import 'package:flutter/widgets.dart';
import 'package:shop_flutter_app/components/cart/cart_fake_data.dart';
import 'package:shop_flutter_app/components/product_card.dart';
import 'package:shop_flutter_app/models/cart_product.dart';
import 'package:shop_flutter_app/models/product.dart';

class MainPageState {
  static MainPageState initState = MainPageState(
    items: [],
  );

  final List<CartProduct> items;

  const MainPageState({
    required this.items,
  });

  MainPageState copyWith({
    List<CartProduct>? items,
  }) =>
      MainPageState(
        items: items ?? this.items,
      );
}
