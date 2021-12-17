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
  testWidgets('Check Widget ProductCard based on Product', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    Product product = Product.testProduct;
    await tester.pumpWidget(MaterialApp(
      home: SizedBox(
        child: SizedBox(
          height: 100,
          child: ProductCard(
            product: product,
            showTags: false,
          ),
        ),
      ),
    ));

    // Create the Finders.
    final productCard = find.byKey(ProductCard.createkey(product));
    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(productCard, findsOneWidget);
  });
}
