import 'package:hive/hive.dart';
import 'package:shop_flutter_app/models/product.dart';
import 'package:shop_flutter_app/models/tag.dart';

import 'hive_tag.dart';

part 'hive_product.g.dart';

@HiveType(typeId: 2)
class HiveProduct {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? imageUrl;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final List<HiveTag> tags;

  HiveProduct({
    required this.id,
    required this.title,
    this.imageUrl,
    this.description,
    required this.price,
    required this.tags,
  });

  Product toProduct() {
    List<Tag> newTags = [];
    for (HiveTag i in tags) {
      newTags.add(i.toTag());
    }
    return Product(
        id: id,
        title: title,
        price: price,
        tags: newTags,
        imageUrl: imageUrl,
        description: description);
  }

  static HiveProduct fromProduct(Product product) {
    List<HiveTag> newTags = [];
    for (Tag i in product.tags) {
      newTags.add(HiveTag.fromTag(i));
    }
    return HiveProduct(
      id: product.id,
      title: product.title,
      price: product.price,
      tags: newTags,
      imageUrl: product.imageUrl,
      description: product.description,
    );
  }
}
