import 'package:flutter/material.dart';
import 'package:shop_flutter_app/models/product.dart';

class ProductCard extends StatelessWidget {
  static Key createKey(Product product) => ObjectKey(product);
  final void Function()? onTap;

  final bool showTags;

  final Product product;

  ProductCard({required this.product, this.showTags = true, this.onTap})
      : super(key: createKey(product));

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: ShapeDecoration(
            image: product.imageUrl == null
                ? null
                : DecorationImage(
                    image: NetworkImage(
                      product.imageUrl ?? "",
                    ),
                    fit: BoxFit.cover,
                  ),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            shadows: [
              // 0px 2px 4px -1px rgba(0, 0, 0, 0.2),
              //     0px 4px 5px 0px rgba(0, 0, 0, 0.14),
              //     0px 1px 10px 0px rgba(0, 0, 0, 0.12);
              BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 4,
                spreadRadius: -1,
                color: Colors.black.withOpacity(0.2),
              ),
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 5,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.14),
              ),
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.12),
              ),
            ],
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

  const ButtonTag(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text),
    );
  }
}
