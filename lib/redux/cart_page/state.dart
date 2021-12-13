import 'package:shop_flutter_app/components/cart/cart_fake_data.dart';
import 'package:shop_flutter_app/components/product_card.dart';
import 'package:shop_flutter_app/models/cart_product.dart';
import 'package:shop_flutter_app/models/product.dart';

class CartPageState {
  static CartPageState initState = CartPageState(
    items: [
      CartProduct(
          amount: 3,
          product: Product(
            title: "Пирожки",
            tags: [],
            imageUrl:
                "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg",
            price: 98,
            id: '',
          )),
      CartProduct(
          amount: 3,
          product: Product(
            title: "Рыба",
            tags: [],
            imageUrl:
                "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg",
            price: 98,
            id: '',
          ))
    ],
  );

  final List<CartProduct> items;

  const CartPageState({
    required this.items,
  });

  CartPageState copyWith({
    List<CartProduct>? items,
  }) =>
      CartPageState(
        items: items ?? this.items,
      );
}
