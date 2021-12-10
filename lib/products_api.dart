import 'package:shop_flutter_app/models/product.dart';

abstract class ProductsApi {
  Future<List<Product>> getProducts();
}

class MockProductsApi implements ProductsApi {
  @override
  Future<List<Product>> getProducts() async {
    return [
      Product(id: 'product1', title: 'Product', price: 100, tags: [])
    ];
  }
}
