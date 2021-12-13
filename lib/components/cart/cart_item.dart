import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_flutter_app/models/cart_product.dart';
import 'package:shop_flutter_app/models/product.dart';

/// This is the stateless widget that the main application instantiates.
class CartItem extends StatelessWidget {
  final CartProduct data;
  final void Function(int) onAmountIncreased;
  final void Function(int) onAmountDecreased;
  final int index;

  const CartItem({
    Key? key,
    required this.data,
    required this.onAmountIncreased,
    required this.onAmountDecreased,
    required this.index,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          // side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
        child: SizedBox(
            height: 100,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(data.product.imageUrl!),
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
                              data.product.title,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          // Expanded(
                          //   flex: 2,
                          //   child: Text(
                          //     data.tags data.tags.toString(),
                          //     style: const TextStyle(color: Colors.grey),
                          //   ),
                          // ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '\$' + data.product.price.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () =>
                                              onAmountIncreased(index),
                                          icon: const Icon(Icons.add_rounded)),
                                      Text(
                                        data.amount.toString(),
                                      ),
                                      IconButton(
                                          onPressed: () =>
                                              onAmountDecreased(index),
                                          icon:
                                              const Icon(Icons.remove_rounded)),
                                    ]),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}
