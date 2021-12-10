import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

class CardItemData {
  final String description;
  final String tag;
  int amount;
  final String imageUrl;
  final int price;
  final void Function(int) onAmountIncreased;
  final void Function(int) onAmountDecreased;
  final int index;

  CardItemData({
    required this.description,
    required this.tag,
    required this.amount,
    required this.imageUrl,
    required this.price,
    required this.onAmountIncreased,
    required this.onAmountDecreased,
    required this.index,
  });
}

/// This is the stateless widget that the main application instantiates.
class CartItem extends StatelessWidget {
  final CardItemData data;

  const CartItem({
    Key? key,
    required this.data,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
              height: 100,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(data.imageUrl),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                data.description,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                data.tag,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () => data.onAmountIncreased(data.index),
                                        icon: const Icon(Icons.add_rounded)),
                                    Text(data.amount.toString()),
                                    IconButton(
                                        onPressed: () => data.onAmountDecreased(data.index),
                                        icon: const Icon(Icons.remove_rounded)),
                                  ]),
                            ),
                          ],
                        ),
                      )),
                ],
              )),
        ),
      ),
    );
  }
}
