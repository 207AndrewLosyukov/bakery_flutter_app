import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String url;

  const ProductCard({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: NetworkImage(
              url,
            ),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
            side: const BorderSide(
              width: 1,
              color: Colors.black,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                  "Красивое\nописание товара",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Railway',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Wrap(
                spacing: 10,
                children: const [
                  // Сюда складывать все тэги
                  ButtonTag(),
                  ButtonTag(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonTag extends StatelessWidget {
  const ButtonTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(width: 1, color: Colors.black),
        color: Colors.white54,
      ),
      child: InkWell(
        onTap: () {},
        child: const Text(
          "Some tag",
          style: TextStyle(
            color: Colors.black,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
