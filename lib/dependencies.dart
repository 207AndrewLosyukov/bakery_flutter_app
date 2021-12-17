import 'package:redux/redux.dart';
import 'package:shop_flutter_app/data_api/auth_dao.dart';
import 'package:shop_flutter_app/data_api/database_dao.dart';
import 'package:shop_flutter_app/database/cart_dao.dart';
import 'package:shop_flutter_app/database/init_hive.dart';
import 'package:shop_flutter_app/network/dao.dart';
import 'package:shop_flutter_app/redux/state.dart';
import 'package:shop_flutter_app/redux/store.dart';
import 'package:shop_flutter_app/screens/navigator.dart';

import 'data_api/network_dao.dart';
import 'database/auth_dao.dart';

class Dependencies {
  final ProductApiDao productsApi;
  late final Store<GlobalState> store = MyStoreBuilder.build();
  final AppNavigator navigator;
  final CartProductDao cartProductDao;
  final AuthDao authDao;

  static late Dependencies _instance;
  Dependencies._(
      this.navigator, this.productsApi, this.cartProductDao, this.authDao);

  static Future<Dependencies> init() async {
    final hiveBuilder = await HiveBuilder.build();
    final cartProductDao = DatabaseApi(database: hiveBuilder.cartBox);
    final authDao = AuthDaoApi(database: hiveBuilder.userBox);

    return _instance = Dependencies._(
      AppNavigator(),
      NetworkApi(),
      cartProductDao,
      authDao,
    );
  }

  static Dependencies get instance => _instance;
}
