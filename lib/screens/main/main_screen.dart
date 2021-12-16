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
    const iconSize = 28.0;
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: iconSize,
            ),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: iconSize,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: iconSize,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
