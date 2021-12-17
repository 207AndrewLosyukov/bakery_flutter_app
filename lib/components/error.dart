import 'package:flutter/material.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/redux/main_page/thunk.dart';

class ErrDaoNoConnection extends StatelessWidget {
  const ErrDaoNoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Container(
              child: const Text("Ошибка.......404",
                  style: TextStyle(fontSize: 30)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Creates border
                  color: Colors.orangeAccent[500]),
            ),
          ),
          TextButton(
            onPressed: () => Dependencies.instance.store.dispatch(
              DownloadList(),
            ),
            child: const Text(
              "Retry",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
