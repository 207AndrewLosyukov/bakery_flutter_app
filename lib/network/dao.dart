import 'package:shop_flutter_app/data_api/network_dao.dart';
import 'package:shop_flutter_app/models/product.dart';
import 'package:dio/dio.dart';

class NetworkApi extends ProductApiDao {
  static const _rootUrl = 'https://server-shop-flutter-app.herokuapp.com/';
  final Dio _dio = Dio();

  NetworkApi();

  @override
  Future<List<Product>> getProducts() async {
    final response = await _dio.get(_rootUrl + "?offset=0&count=1000");
    List<Product> result = [];
    for (final element in response.data) {
      result.add(Product.fromJson(element));
    }
    return result;
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    final response = await _dio.get(_rootUrl + "search/?query=$query");
    List<Product> result = [];
    for (final element in response.data) {
      result.add(Product.fromJson(element));
    }
    return result;
  }
}
