import 'package:flutter/material.dart';
import 'package:shop_flutter_app/dependencies.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.black, width: 3.0)),
            child: const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 100),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Вы зашли, как\nДмитрий В.",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 40),
            child: CircleAvatar(
              backgroundColor: Colors.brown[300],
              radius: 70,
              child: Image.network(
                  "https://flomaster.club/uploads/posts/2021-11/1635833030_1-flomaster-club-p-narisovannii-yeltsin-krasivii-risunok-1.png"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 10),
            child: Flexible(
              flex: 2,
              child: Text(
                "Почта:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Expanded(
              child: Text(
                "trumpyandex1@gmail.com",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: TextButton(
              onPressed: () {
                //Dependencies.instance.store.dispatch();
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.black, width: 3.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 23, horizontal: 40),
                    child: Text("Выйти из профиля",
                        style: TextStyle(fontSize: 23)),
                  )),
            ),
          ),
          Flexible(
            child: ListView(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
