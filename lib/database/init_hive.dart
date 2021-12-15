import 'package:flutter/cupertino.dart';
import 'package:shop_flutter_app/database/models/hive_cart_product.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_flutter_app/database/models/hive_product.dart';
import 'package:shop_flutter_app/database/models/hive_tag.dart';

import 'models/hive_cart_product.dart';

class HiveBuilder {
  final Box<HiveCartProduct> cartBox;
  HiveBuilder._(this.cartBox);

  static Future<HiveBuilder> build() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveCartProductAdapter());
    Hive.registerAdapter(HiveProductAdapter());
    Hive.registerAdapter(HiveTagAdapter());

    return HiveBuilder._(
      await Hive.openBox('items'),
    );
  }
}