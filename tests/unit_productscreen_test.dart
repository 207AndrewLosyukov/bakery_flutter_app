import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_flutter_app/components/cart/cart_item.dart';
import 'package:shop_flutter_app/components/product_card.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/product.dart';
import 'package:shop_flutter_app/screens/product.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows building and interacting
  // with widgets in the test environment.
  test(
    'Unit test for productScreen to check fields and methods',
    () {
      ProductScreen ps = ProductScreen(product: Product.testProduct);
      var i = ps.createState();

      expect(i.isExistAddButton, false);
      expect(i.isExistRemoveButton, false);
      expect(i.isExistSecondButton, false);
      expect(i.hasItemInCart, false);
      expect(i.countOfAdded, 0);
    },
  );
}
