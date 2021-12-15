import 'package:json_annotation/json_annotation.dart';
import 'package:shop_flutter_app/models/tag.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String id;
  final String title;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  final String? description;

  final double price;

  final List<Tag> tags;

  static final Product testProduct = Product(
    id: "1",
    title: "Cheburashka",
    imageUrl:
        "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg",
    description:
        "Булочки обычно пекут из сдобного дрожжевого теста и чаще всего круглой формы. В булочке может быть сладкая начинка или изюм, иногда их посыпают маком, корицей или кунжутом. А еще они могут быть пресными, ржаными, из небеленой муки или с добавлением цельных злаков — и вообще какими угодно. Словом, булочка — практически универсальный формат выпечки, с которым очень удобно иметь дело на кухне.Булочки обычно пекут из сдобного дрожжевого теста и чаще всего круглой формы. В булочке может быть сладкая начинка или изюм, иногда их посыпают маком, корицей или кунжутом. А еще они могут быть пресными, ржаными, из небеленой муки или с добавлением цельных злаков — и вообще какими угодно. Словом, булочка — практически универсальный формат выпечки, с которым очень удобно иметь дело на кухне.Булочки обычно пекут из сдобного дрожжевого теста и чаще всего круглой формы. В булочке может быть сладкая начинка или изюм, иногда их посыпают маком, корицей или кунжутом. А еще они могут быть пресными, ржаными, из небеленой муки или с добавлением цельных злаков — и вообще какими угодно. Словом, булочка — практически универсальный формат выпечки, с которым очень удобно иметь дело на кухне.",
    price: 1,
    tags: [
      Tag(
        id: "1",
        title: "Новинка",
      )
    ],
  );

  Product({
    required this.id,
    required this.title,
    this.imageUrl,
    this.description,
    required this.price,
    required this.tags,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
