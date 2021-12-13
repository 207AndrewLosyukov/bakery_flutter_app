import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_flutter_app/main.dart';
import 'package:shop_flutter_app/models/product.dart';
import 'package:shop_flutter_app/screens/product.dart';

class AppNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final bottomBarKey = GlobalKey<MainBottomNavigationBarState>();

  openMainPage() => bottomBarKey.currentState?.openMainPage();
  openCartPage() => bottomBarKey.currentState?.openCartPage();
  openProfilePage() => bottomBarKey.currentState?.openProfilePage();

  openProduct(Product product) {
    navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => ProductScreen(product: product),
    ));
  }

  pop() {
    return navigatorKey.currentState?.pop();
  }
}
