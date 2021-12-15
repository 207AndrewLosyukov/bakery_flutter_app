import 'package:flutter/material.dart';
import 'package:shop_flutter_app/components/product_card.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Widget? firstButton;
  Widget? secondButton;

  bool isExistSecondButton = false;
  bool isExistAddButton = false;
  bool isExistRemoveButton = false;

  int countOfAdded = 0;
  String textOnFirstButton = "Добавить в корзину";

  void getExtraButton() {
    setState(
      () => {
        isExistSecondButton = true,
        isExistAddButton = true,
        isExistRemoveButton = true,
      },
    );
  }

  void getNewTextOnFirstButton() {
    setState(() => textOnFirstButton = "Товаров в корзине $countOfAdded");
  }

  void addToCart() {
    setState(
      () => {
        countOfAdded++,
        textOnFirstButton = "Товаров в корзине $countOfAdded",
      },
    );
  }

  void removeFromCart() {
    setState(
      () => {
        countOfAdded--,
        textOnFirstButton = "Товаров в корзине $countOfAdded",
        if (countOfAdded == 0)
          {
            isExistAddButton = false,
            isExistRemoveButton = false,
            isExistSecondButton = false,
            textOnFirstButton = "Добавить в корзину",
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (isExistRemoveButton)
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 60,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          removeFromCart();
                        },
                        child: const Text("-"),
                      ),
                    ),
                  ),
                ),
              if (!isExistSecondButton)
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Container(
                        height: 60,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: const BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            addToCart();
                            getExtraButton();
                          },
                          child: Text(textOnFirstButton),
                        ),
                      ),
                    ),
                  ),
                ),
              if (isExistSecondButton)
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 60,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: Center(child: Text(textOnFirstButton)),
                    ),
                  ),
                ),
              if (isExistAddButton)
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 60,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          addToCart();
                        },
                        child: const Text("+"),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (isExistSecondButton)
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                height: 60,
                width: 200,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
                child: TextButton(
                  // переход в корзину
                  onPressed: () {
                    Dependencies.instance.navigator.openCartPage();
                  },
                  child: const Text("Перейти в корзину"),
                ),
              ),
            ),
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.orange[100],
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      widget.product.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: 200,
                      child: ProductCard(product: widget.product),
                    ),
                  ),
                  Text(
                    "\t\t\t" + (widget.product.description ?? ""),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
