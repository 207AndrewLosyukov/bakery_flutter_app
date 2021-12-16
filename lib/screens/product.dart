import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop_flutter_app/components/product_card.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/cart_product.dart';
import 'package:shop_flutter_app/models/product.dart';
import 'package:shop_flutter_app/redux/cart_page/state.dart';
import 'package:shop_flutter_app/redux/cart_page/thunk.dart';
import 'package:shop_flutter_app/redux/state.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isExistSecondButton = false;
  bool isExistAddButton = false;
  bool isExistRemoveButton = false;

  int countOfAdded = 0;
  String textOnFirstButton = "Добавить в корзину";

  int? getIndexOfCartProductById(List<CartProduct> items) {
    for (int i = 0; i < items.length; i++) {
      if (widget.product.id == items[i].product.id) {
        return i;
      }
    }
    return null;
  }

   int _getNumberOfCartProduct(List<CartProduct> items) {
    int? index = getIndexOfCartProductById(items);
    if (index == null) {
      return 0;
    }
    return items[index].amount;
  }

  void getExtraButton() {
    setState(
          () =>
      {
        isExistSecondButton = true,
        isExistAddButton = true,
        isExistRemoveButton = true,
      },
    );
  }

  void getNewTextOnFirstButton() {
    setState(() => textOnFirstButton = "Товаров в корзине $countOfAdded");
  }

  void addToCart(items) {
    if (_getNumberOfCartProduct(items) > 0) {
      Dependencies.instance.store.dispatch(IncreaseNumberOfProducts(widget.product.id));
    } else {
      Dependencies.instance.store.dispatch(InsertProduct(widget.product));
    }
  }

  void removeFromCart(items) {
      Dependencies.instance.store.dispatch(DecreaseNumberOfProducts(widget.product.id));
  }

  bool get hasItemInCart => countOfAdded > 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(),
      bottomNavigationBar: StoreConnector<GlobalState, CartPageState>(
          converter: (store) => store.state.cartPage,
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    if (_getNumberOfCartProduct(state.items) > 0)
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
                                removeFromCart(state.items);
                              },
                              child: const Text("-"),
                            ),
                          ),
                        ),
                      ),
                    if (_getNumberOfCartProduct(state.items) == 0)
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
                                  addToCart(state.items);
                                  getExtraButton();
                                },
                                child: const Text(
                                      "Добавить в корзину",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (_getNumberOfCartProduct(state.items) > 0)
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
                            child: Center(child: Text('${_getNumberOfCartProduct(state.items)}')),
                          ),
                        ),
                      ),
                    if (_getNumberOfCartProduct(state.items) != 0)
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
                                addToCart(state.items);
                              },
                              child: const Text("+"),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                if (_getNumberOfCartProduct(state.items) > 0)
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
            );
          }),
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
