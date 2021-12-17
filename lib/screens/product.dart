import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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

  void addToCart(items) {
    if (_getNumberOfCartProduct(items) > 0) {
      Dependencies.instance.store
          .dispatch(IncreaseNumberOfProducts(widget.product.id));
    } else {
      Dependencies.instance.store.dispatch(InsertProduct(widget.product));
    }
  }

  void removeFromCart(items) {
    Dependencies.instance.store
        .dispatch(DecreaseNumberOfProducts(widget.product.id));
  }

  bool get hasItemInCart => countOfAdded > 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange[100],
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: true,
              expandedHeight: MediaQuery.of(context).size.height / 2,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.product.title +
                    '   \$' +
                    widget.product.price.toString() +
                    '/шт.'),
                background: Image(
                  image: NetworkImage(widget.product.imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      (widget.product.description ?? ""),
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
          ],
        ),
      ),
      bottomNavigationBar: StoreConnector<GlobalState, CartPageState>(
        converter: (store) => store.state.cartPage,
        builder: (context, state) {
          return Container(
            color: Colors.orange[100],
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          IconButton(
                            onPressed: () => removeFromCart(state.items),
                            icon: const CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 30,
                              child: Icon(
                                Icons.remove_rounded,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 36,
                              child: Center(
                                child: Text(
                                  _getNumberOfCartProduct(state.items)
                                      .toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => addToCart(state.items),
                            icon: const CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 30,
                              child: Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]),
                        Text(
                          'Итого: \$' +
                              (widget.product.price *
                                      _getNumberOfCartProduct(state.items))
                                  .toString(),
                          style: const TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          primary: Colors.black,
                        ),
                        onPressed: () {
                          Dependencies.instance.navigator.openCartPage();
                        },
                        child: const Text('Перейти в корзину'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
