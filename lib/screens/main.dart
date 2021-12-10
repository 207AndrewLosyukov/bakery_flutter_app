import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        child: Container(
          width: 100,
          height: 199,
          color: Colors.red,
        ),
      ),
    );
  }
}
