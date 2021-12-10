import 'package:flutter/material.dart';
import 'package:shop_flutter_app/components/productcard.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const List<String> urls = [
    "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg",
    "https://thumbs.dreamstime.com/b/булочки-пекарни-с-маковыми-семененами-и-сезамом-творога-варенье-на-202153719.jpg",
    "https://image.freepik.com/free-photo/assortment-of-baked-goods-in-black-background_73558-4085.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 5,
          child: Container(
            height: 100,
            color: Colors.orange[100],
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: CircleAvatar(
                    radius: 45,
                    child: Image.network(
                        "https://flomaster.club/uploads/posts/2021-11/1635833030_1-flomaster-club-p-narisovannii-yeltsin-krasivii-risunok-1.png"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Добрый день, Дмитрий!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        child: const Text(
                          "Перейти в профиль",
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.orange[100],
            width: double.maxFinite,
            height: 50,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Рекомендованное:",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 150,
          color: Colors.orange[100],
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
              scrollDirection: Axis.horizontal,
              itemCount: urls.length,
              itemBuilder: (context, i) => ProductCard(url: urls[i])),
        ),
        Container(height: 10, color: Colors.orange[100]),
        SizedBox(
          height: 200,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 0,
                bottom: const TabBar(
                  tabs: [
                    Tab(text: "Новинки"),
                    Tab(text: "Скидка"),
                    Tab(text: "Рекомендация"),
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
