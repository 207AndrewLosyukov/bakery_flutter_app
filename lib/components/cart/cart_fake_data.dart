import 'package:shop_flutter_app/components/product_card.dart';
import 'package:shop_flutter_app/models/cart_product.dart';

final List<String> titles = <String>['Круассан с маком', 'Блинчики', 'Коктейль', 'Молоко', 'E', 'F'];
final List<int> amounts = <int>[1, 2, 3, 3, 1, 3];
final List<String> images = <String>[
  'https://thumbs.dreamstime.com/b/%D0%BA%D1%80%D1%83%D0%B0%D1%81%D1%81%D0%B0%D0%BD-%D0%BD%D0%B0-%D1%87%D0%B5%D1%80%D0%BD%D0%BE%D0%BC-%D1%84%D0%BE%D0%BD%D0%B5-%D1%81-%D1%81%D0%B0%D1%85%D0%B0%D1%80%D0%BE%D0%BC-159283320.jpg',
  "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg",
  "https://thumbs.dreamstime.com/b/булочки-пекарни-с-маковыми-семененами-и-сезамом-творога-варенье-на-202153719.jpg",
  "https://image.freepik.com/free-photo/assortment-of-baked-goods-in-black-background_73558-4085.jpg",
  "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg",
  "https://thumbs.dreamstime.com/b/булочки-пекарни-с-маковыми-семененами-и-сезамом-творога-варенье-на-202153719.jpg",
];
final List<double> prices = <double>[100, 212, 312, 4343, 121, 21];

final List<CartProduct> cartFakeData = [];