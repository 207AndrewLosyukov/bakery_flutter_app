import 'package:shop_flutter_app/models/cart_product.dart';

abstract class CartProductDao {
  void putCartProduct(CartProduct cartProduct);
  CartProduct? getCartProductById(String id);
  void deleteCartProductById(String id);
  List<CartProduct> getCartProductList();
}
