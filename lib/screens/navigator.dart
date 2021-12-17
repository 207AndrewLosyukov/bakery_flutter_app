import 'package:flutter/material.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/product.dart';
import 'package:shop_flutter_app/redux/cart_page/thunk.dart';
import 'package:shop_flutter_app/screens/auth.dart';
import 'package:shop_flutter_app/screens/main/main_screen.dart';
import 'package:shop_flutter_app/screens/order.dart';
import 'package:shop_flutter_app/screens/product.dart';
import 'package:shop_flutter_app/screens/ready_order.dart';
import 'package:shop_flutter_app/screens/search.dart';

class AppNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final bottomBarKey = GlobalKey<MainScreenState>();

  openMainPage() => bottomBarKey.currentState?.openMainPage();
  openCartPage() {
    navigatorKey.currentState?.pop(); // todo: popUntil
    bottomBarKey.currentState?.openCartPage();
    // navigatorKey.currentState?.push(MaterialPageRoute(
    //   builder: (context) => const CartTab(),
    // ));
  }

  openAuthPage() => navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      ));

  openProfilePage() => bottomBarKey.currentState?.openProfilePage();

  openOrder() {
    navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => const OrderScreen(),
    ));
  }

  openReadyOrder() {
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
      builder: (context) => const ReadyOrderScreen(),
    ));
    Dependencies.instance.store
        .dispatch(ClearCart()); //TODO Why here may be all actions?
  }

  openProduct(Product product) {
    navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => ProductScreen(product: product),
    ));
  }

  openSearch() {
    navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => const SearchScreen(),
    ));
  }

  pop() {
    return navigatorKey.currentState?.pop();
  }
}
