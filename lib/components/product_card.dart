import 'package:flutter/material.dart';
import 'package:shop_flutter_app/models/product.dart';

class ProductCard extends StatelessWidget {
  static Key createkey(Product product) => ObjectKey(product);
  final void Function()? onTap;

  final bool showTags;

  final Product product;

  ProductCard({required this.product, this.showTags = true, this.onTap})
      : super(key: createkey(product));

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: ShapeDecoration(
            image: product.imageUrl==null?null:DecorationImage(
              image: NetworkImage
              (
                product.imageUrl ?? "",
              ),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
              side: const BorderSide(
                width: 1,
                color: Colors.black,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Railway',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // if (showTags)
                //   Wrap(
                //     spacing: 8,
                //     children: product.tags.map((v) => ButtonTag(v.title)).toList(),
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonTag extends StatelessWidget {
  final String text;

  ButtonTag(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text),
    );
  }
}
