/// Flutter code sample for Card

// This sample shows creation of a [Card] widget that shows album information
// and two actions.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_flutter_app/components/cart/cart_item.dart';
import 'package:shop_flutter_app/database/models/hive_cart_product.dart';
import 'package:shop_flutter_app/database/models/hive_product.dart';
import 'package:shop_flutter_app/database/models/hive_tag.dart';
import 'package:shop_flutter_app/database/init_hive.dart';
import 'package:shop_flutter_app/models/cart_product.dart';
import 'package:shop_flutter_app/models/product.dart';
import 'package:shop_flutter_app/screens/main/cart_tab.dart';

import '../dependencies.dart';


void main() async {
  await Dependencies.init();
  HiveBuilder builder = await HiveBuilder.build();
  final box = builder.cartBox;
  // Hive.registerAdapter(HiveCartProductAdapter());
  //final box = await Hive.openBox<HiveCartProduct>('items');
  // HiveBuilder box = await HiveBuilder.build();
  //Hive.registerAdapter(HiveCartProductAdapter());
  // final box = await Hive.openBox<HiveCartProduct>('items');
  await box.put('1', HiveCartProduct(amount: 1, product: HiveProduct(title: "Пирожки",
    tags: [HiveTag(title: "dfdd", id: "ds")],
    imageUrl:
    "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg",
    price: 98,
    id: '',)));
  final kek = box.get('1');
  log(kek!.amount.toString());
  log(kek.product.title.toString());
  // dynamic g = box.cartBox.get('1');
  // print(g);
  // runApp(const MyApp());
}

