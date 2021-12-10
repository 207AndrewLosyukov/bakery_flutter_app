import 'package:flutter/material.dart';

import 'cart_item.dart';

class CartStore {
  // List<int> ;
  // List<int>

  CartStore() {}
}

class CartItemList extends StatefulWidget {
  //final Future<List> quiz;

  const CartItemList({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  _CartItemListState createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  bool loading = true;

  // _CartItemListState() {
  //   // widget.quiz.then((List value) {
  //   //   // loop through the json object
  //   //   for (var i = 0; i < value.length; i++) {
  //   //     // add the ListTile to an array
  //   //     listArray.add(new ListTile(title: new Text(value[i].name));
  //   //
  //   //     }
  //   //
  //   //         //use setState to refresh UI
  //   //         setState(()
  //   //     {
  //   //       loading = false;
  //   //     });
  //   //
  //   // });
  // }
  int _counter = 22;
  final List<String> entries = <String>['A', 'B', 'C', 'A', 'A'];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
    3124,
    312,
    123,
    123,
    321,
    1,
    32
  ];

  void _increaseCounter(int index) {
    setState(() {
      ++colorCodes[index];
    });
  }

  void _decreaseCounter(int index) {
    setState(() {
      --colorCodes[index];
    });
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 300,
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return CartItem(
              data: CardItemData(
                amount: colorCodes[index],
                description: 'Круассан с вишней',
                tag: 'Круасссаны | 500г',
                imageUrl:
                    'https://thumbs.dreamstime.com/b/%D0%BA%D1%80%D1%83%D0%B0%D1%81%D1%81%D0%B0%D0%BD-%D0%BD%D0%B0-%D1%87%D0%B5%D1%80%D0%BD%D0%BE%D0%BC-%D1%84%D0%BE%D0%BD%D0%B5-%D1%81-%D1%81%D0%B0%D1%85%D0%B0%D1%80%D0%BE%D0%BC-159283320.jpg',
                price: 1,
                onAmountIncreased: _increaseCounter,
                onAmountDecreased: _decreaseCounter,
                index: index,
              ),
            );
          }),
    );
  }
}
