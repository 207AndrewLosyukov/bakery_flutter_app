import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/screens/auth.dart';
import 'package:shop_flutter_app/screens/main/main_screen.dart';
import 'package:shop_flutter_app/screens/navigator.dart';

void main() async {
  await Dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final user = Dependencies.instance .authDao.getCurrentUser();
    return StoreProvider(
      store: Dependencies.instance.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: user==null?AuthScreen():MainScreen(key:AppNavigator.bottomBarKey),
        navigatorKey: AppNavigator.navigatorKey,
      ),
    );
  }
}
