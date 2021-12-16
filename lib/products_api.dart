import 'dart:math';

import 'package:shop_flutter_app/models/product.dart';

abstract class ProductsApi {
  Future<List<Product>> getProducts();
}

class MockProductsApi implements ProductsApi {
  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(Duration(seconds: Random().nextInt(10)));
    return [
      Product(
          id: 'product1',
          title: 'Product',
          price: 100,
          tags: [],
          imageUrl:
              "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg"),
      Product(
          id: 'product2',
          title: 'Product',
          price: 100,
          tags: [],
          imageUrl:
              "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg"),
      Product(
          id: 'product3',
          title: 'Product',
          price: 100,
          tags: [],
          imageUrl:
              "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg"),
      Product(
          id: 'product4',
          title: 'Product',
          price: 100,
          tags: [],
          imageUrl:
              "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg"),
      Product(
          id: 'product5',
          title: 'Product',
          price: 100,
          tags: [],
          imageUrl:
              "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg"),
      Product(
          id: 'product6',
          title: 'Product',
          price: 100,
          tags: [],
          imageUrl:
              "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg"),
      Product(
          id: 'product7',
          title: 'Product',
          price: 100,
          tags: [],
          imageUrl:
              "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg"),
      Product(
          id: 'product8',
          title: 'Product',
          price: 100,
          tags: [],
          imageUrl:
              "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg"),
      Product(
          id: 'product9',
          title: 'Product',
          price: 100,
          tags: [],
          imageUrl:
              "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg"),
    ];
  }
}
