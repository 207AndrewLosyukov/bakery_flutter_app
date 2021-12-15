import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_flutter_app/screens/main/cart_tab.dart';
import 'package:shop_flutter_app/screens/main/main_tab.dart';
import 'package:shop_flutter_app/screens/main/profile_tab.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() =>
      MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int currentTab = 0;

  openMainPage() => setState(() => currentTab = 0);
  openCartPage() => setState(() => currentTab = 1);
  openProfilePage() => setState(() => currentTab = 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('TabBar Widget'),
      // ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: <Widget>[
          const MainTab(),
          const CartTab(),
          const ProfileTab(),
        ][currentTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int i) {
          setState(() => currentTab = i);
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: 10,
              height: 10,
              color: Colors.red,
            ),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 10,
              height: 10,
              color: Colors.red,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 10,
              height: 10,
              color: Colors.red,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
