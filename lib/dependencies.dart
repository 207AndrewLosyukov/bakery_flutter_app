import 'package:redux/redux.dart';
import 'package:shop_flutter_app/products_api.dart';
import 'package:shop_flutter_app/redux/state.dart';
import 'package:shop_flutter_app/redux/store.dart';
import 'package:shop_flutter_app/screens/navigator.dart';

class Dependencies {
  final ProductsApi productsApi;
  late final Store<GlobalState> store = MyStoreBuilder.build();
  final AppNavigator navigator;

  static late Dependencies _instance;

  Dependencies._(this.navigator, this.productsApi);

  static Future<Dependencies> init() async {
    return _instance = Dependencies._(
      AppNavigator(),
      MockProductsApi(),
    );
  }

  static Dependencies get instance => _instance;
}
