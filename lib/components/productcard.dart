import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final double width;
  final double height;

  const ProductCard({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    "https://i.ytimg.com/vi/p94QPaI4SxE/mqdefault.jpg"),
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
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 10, top: height * 2 / 3),
            child: Expanded(
              child: Wrap(
                spacing: width / 15,
                children: [
                  // Сюда складывать все тэги
                  ButtonTag(width: width, height: height),
                  ButtonTag(width: width, height: height),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonTag extends StatelessWidget {
  final double width;
  final double height;

  const ButtonTag({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 5.0,
      width: width / 4.286,
      child: Expanded(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white54),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: const BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            "Some tag",
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}

//
