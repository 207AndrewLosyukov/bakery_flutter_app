import 'package:flutter/material.dart';
import 'package:shop_flutter_app/components/product_card.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/product.dart';
import 'package:shop_flutter_app/screens/navigator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const List<String> urls = [
    "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg",
    "https://thumbs.dreamstime.com/b/булочки-пекарни-с-маковыми-семененами-и-сезамом-творога-варенье-на-202153719.jpg",
    "https://image.freepik.com/free-photo/assortment-of-baked-goods-in-black-background_73558-4085.jpg",
    "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg",
    "https://thumbs.dreamstime.com/b/булочки-пекарни-с-маковыми-семененами-и-сезамом-творога-варенье-на-202153719.jpg",
    "https://image.freepik.com/free-photo/assortment-of-baked-goods-in-black-background_73558-4085.jpg",
    "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg",
    "https://thumbs.dreamstime.com/b/булочки-пекарни-с-маковыми-семененами-и-сезамом-творога-варенье-на-202153719.jpg",
    "https://image.freepik.com/free-photo/assortment-of-baked-goods-in-black-background_73558-4085.jpg",
    "https://image.freepik.com/free-photo/baking-ingredients-on-black-background_88281-3772.jpg",
    "https://thumbs.dreamstime.com/b/булочки-пекарни-с-маковыми-семененами-и-сезамом-творога-варенье-на-202153719.jpg",
    "https://image.freepik.com/free-photo/assortment-of-baked-goods-in-black-background_73558-4085.jpg",
  ];

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var testListView = Container(
      color: Colors.orange[100],
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: MainScreen.urls.length,
        itemBuilder: (context, i) => ProductCard(url: MainScreen.urls[i]),
      ),
    );

    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.orange[100],
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: CircleAvatar(
                          backgroundColor: Colors.brown[300],
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
                              onTap: () => Dependencies.instance.navigator
                                  .openProfilePage(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
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
              SliverToBoxAdapter(
                  child: SizedBox(height: 150, child: testListView)),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SliverAppBar(
                toolbarHeight: 0,
                pinned: true,
                backgroundColor: Colors.brown[300],
                bottom: const TabBar(
                  tabs: [
                    Tab(text: "Новинка"),
                    Tab(text: "Скидка"),
                    Tab(text: "Популярное"),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                sliver: Builder(
                  builder: (context) {
                    final tabController = DefaultTabController.of(context);
                    if (tabController == null) {
                      return const SliverToBoxAdapter(child: SizedBox());
                    }
                    return AnimatedBuilder(
                      animation: tabController,
                      builder: (context, i) {
                        final currentTab = tabController.index;
                        print(currentTab);
                        if (currentTab == null) {
                          return const SliverToBoxAdapter(child: SizedBox());
                        }
                        if (currentTab == 0) {
                          return buildTab2();
                        } else if (currentTab == 1) {
                          return buildTab1();
                        } else {
                          return buildTab2();
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTab1() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          return GestureDetector(
            child: ProductCard(url: MainScreen.urls[i], showTags: false),
            // когда будет готова апишка передать сюда текущий продукт
            onTap: () => Dependencies.instance.navigator
                .openProduct(Product.testProduct)(),
          );
        },
        childCount: MainScreen.urls.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 17,
        crossAxisSpacing: 12,
        crossAxisCount: 2,
        childAspectRatio: 16 / 9,
      ),
    );
  }

  Widget buildTab2() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          return GestureDetector(
            child: ProductCard(
                url: MainScreen.urls[MainScreen.urls.length - i - 1],
                showTags: false),
            // когда будет готова апишка передать сюда текущий продукт
            onTap: () => Dependencies.instance.navigator
                .openProduct(Product.testProduct)(),
          );
        },
        childCount: MainScreen.urls.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 17,
        crossAxisSpacing: 12,
        crossAxisCount: 2,
        childAspectRatio: 16 / 9,
      ),
    );
  }
}
