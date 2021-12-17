import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/cart_product.dart';

class CartPageState {
  static CartPageState initState = CartPageState(
    items: Dependencies.instance.cartProductDao.getCartProductList(),
  );

  final List<CartProduct> items;

  const CartPageState({
    required this.items,
  });

  CartPageState copyWith({
    List<CartProduct>? items,
  }) =>
      CartPageState(
        items: items ?? this.items,
      );
}
