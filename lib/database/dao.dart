import 'package:hive/hive.dart';
import 'package:shop_flutter_app/data_api/database_dao.dart';
import 'package:shop_flutter_app/database/models/hive_cart_product.dart';
import 'package:shop_flutter_app/models/cart_product.dart';

class DatabaseApi extends CartProductDao {

  final Box<HiveCartProduct> database;

  DatabaseApi({required this.database});

  @override
  CartProduct? getCartProductById(String id) {
    HiveCartProduct? result = database.get(id);
    if (result == null) {
      return null;
    }
    return result.toCartProduct();
  }

  @override
  List<CartProduct> getCartProductList() {
    List<CartProduct> result = [];
    for (final i in database.values) {
      result.add(i.toCartProduct());
    }
    return result;
  }

  @override
  void putCartProduct(CartProduct cartProduct) {
    database.put(cartProduct.product.id, HiveCartProduct.fromHiveProduct(cartProduct));
  }

  @override
  void deleteCartProductById(String id) {
    database.delete(id);
  }
}