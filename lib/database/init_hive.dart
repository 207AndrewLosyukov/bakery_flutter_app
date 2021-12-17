import 'package:shop_flutter_app/database/models/hive_cart_product.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_flutter_app/database/models/hive_product.dart';
import 'package:shop_flutter_app/database/models/hive_tag.dart';
import 'package:shop_flutter_app/database/models/hive_user.dart';

import 'models/hive_cart_product.dart';

class HiveBuilder {
  final Box<HiveCartProduct> cartBox;
  final Box<HiveUser> userBox;

  HiveBuilder._(this.cartBox, this.userBox);

  static Future<HiveBuilder> build() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveCartProductAdapter());
    Hive.registerAdapter(HiveProductAdapter());
    Hive.registerAdapter(HiveTagAdapter());
    Hive.registerAdapter(HiveUserAdapter());

    return HiveBuilder._(
      await Hive.openBox('items'),
      await Hive.openBox('user'),
    );
  }
}
