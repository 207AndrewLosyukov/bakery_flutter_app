import 'package:shop_flutter_app/models/product.dart';

class CartProduct {
  final Product product;
  final int amount;

  const CartProduct({
    required this.amount,
    required this.product,
  });

  CartProduct copyWith({Product? product, int? amount}) {
    return CartProduct(
        amount: amount ?? this.amount, product: product ?? this.product);
  }
}
