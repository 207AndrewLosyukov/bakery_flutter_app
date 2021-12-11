import 'package:shop_flutter_app/models/product.dart';

class CartProduct {
  final Product product;
  int amount;

  CartProduct(
    this.amount,
    this.product,
  );
}
