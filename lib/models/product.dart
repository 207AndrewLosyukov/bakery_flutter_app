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
