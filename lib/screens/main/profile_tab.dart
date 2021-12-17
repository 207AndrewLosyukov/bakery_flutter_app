import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: const SafeArea(
        child: Center(child: Text("Profile"))
      ),
    );
  }
}
