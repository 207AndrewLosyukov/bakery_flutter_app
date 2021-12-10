import 'package:shop_flutter_app/products_api.dart';

class Dependencies {
  ProductsApi productsApi;
  static late Dependencies _instance;

  Dependencies._({required this.productsApi});

  static Future<Dependencies> init() async {
    return _instance = Dependencies._(
      productsApi: MockProductsApi(),
    );
  }

  static Dependencies get instance => _instance;
}
