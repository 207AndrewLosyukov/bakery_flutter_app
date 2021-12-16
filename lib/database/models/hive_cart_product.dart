import 'package:hive/hive.dart';
import 'package:shop_flutter_app/models/cart_product.dart';
import 'hive_product.dart';

part 'hive_cart_product.g.dart';

@HiveType(typeId: 1)
class HiveCartProduct {
  @HiveField(0)
  final int amount;

  @HiveField(1)
  final HiveProduct product;

  HiveCartProduct({
    required this.amount,
    required this.product,
  });

  CartProduct toCartProduct() {
    return CartProduct(amount: amount, product: product.toProduct());
  }

  static HiveCartProduct fromHiveProduct(CartProduct cartProduct) {
    return HiveCartProduct(
        amount: cartProduct.amount,
        product: HiveProduct.fromProduct(cartProduct.product));
  }
}
