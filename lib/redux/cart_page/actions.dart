import 'package:shop_flutter_app/models/cart_product.dart';

class SetCartItemsListAction {
  final List<CartProduct> items;

  SetCartItemsListAction(this.items);
}
