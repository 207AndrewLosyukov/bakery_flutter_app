import 'package:redux/redux.dart';
import 'package:shop_flutter_app/products_api.dart';
import 'package:shop_flutter_app/redux/state.dart';
import 'package:shop_flutter_app/redux/store.dart';

class Dependencies {
  ProductsApi productsApi;
  late final Store<GlobalState> store = MyStoreBuilder.build();
  static late Dependencies _instance;

  Dependencies._({required this.productsApi});

  static Future<Dependencies> init() async {
    return _instance = Dependencies._(
      productsApi: MockProductsApi(),
    );
  }

  static Dependencies get instance => _instance;
}
