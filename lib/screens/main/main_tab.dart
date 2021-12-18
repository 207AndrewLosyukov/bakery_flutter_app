import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop_flutter_app/components/product_card.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/product.dart';
import 'package:shop_flutter_app/redux/main_page/state.dart';
import 'package:shop_flutter_app/redux/main_page/thunk.dart';
import 'package:shop_flutter_app/redux/state.dart';

class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  @override
  void initState() {
    super.initState();
    Dependencies.instance.store.dispatch(DownloadList());
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, MainPageState>(
        converter: (store) => store.state.mainPage,
        builder: (context, state) {
          final recommendedItems = state.items
              .where((element) =>
                  element.tags.any((element) => element.id == 'recommended'))
              .toList();
          if (!state.isLoaded) {
            return const Center(child: CupertinoActivityIndicator(radius: 8));
          }
          return DefaultTabController(
            length: 3,
            child: SafeArea(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              top: 6,
                              bottom: 6,
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.brown[300],
                              radius: 36,
                              child: Image.network(
                                  "https://flomaster.club/uploads/posts/2021-11/1635833030_1-flomaster-club-p-narisovannii-yeltsin-krasivii-risunok-1.png"),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Добрый день, Дмитрий!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  GestureDetector(
                                    child: const Text(
                                      "Перейти в профиль",
                                    ),
                                    onTap: () => Dependencies.instance.navigator
                                        .openAuthPage(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            iconSize: 24,
                            onPressed: () =>
                                Dependencies.instance.navigator.openSearch(),
                            icon: const Icon(Icons.search),
                            // label: const Text('Поиск'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12, 16, 12, 0),
                      child: Text(
                        "Рекомендованное",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: recommendedItems.length,
                        itemBuilder: (context, i) => ProductCard(
                          product: recommendedItems[i],
                          onTap: () => Dependencies.instance.navigator
                              .openProduct(recommendedItems[i]),
                        ),
                      ),
                    ),
                  ),
                  SliverAppBar(
                    toolbarHeight: 16,
                    pinned: true,
                    backgroundColor: Colors.orange[100],
                    bottom: TabBar(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      indicatorColor: Colors.transparent,
                      labelColor: Theme.of(context).shadowColor,
                      unselectedLabelColor: Theme.of(context).primaryColor,
                      physics: const BouncingScrollPhysics(),
                      isScrollable: true,
                      tabs: const [
                        Tab(text: "Новинка"),
                        Tab(text: "Скидка"),
                        Tab(text: "Популярное"),
                      ],
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      enableFeedback: true,
                      indicator: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(16), // Creates border
                          color: Colors.black.withOpacity(0.1)),
                      padding: const EdgeInsets.all(8),
                      // indicatorSize: TabBarIndicatorSize.tab,
                      // indicatorWeight: 0,
                      // indicatorColor: Colors.brown,
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
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
                            if (currentTab == 0) {
                              return buildTab(state.items
                                  .where((element) => element.tags
                                      .any((element) => element.id == 'new'))
                                  .toList());
                            } else if (currentTab == 1) {
                              return buildTab(state.items
                                  .where((element) => element.tags.any(
                                      (element) => element.id == 'discount'))
                                  .toList());
                            } else {
                              return buildTab(state.items
                                  .where((element) => element.tags.any(
                                      (element) => element.id == 'popular'))
                                  .toList());
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget buildTab(List<Product> products) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          return ProductCard(
            product: products[i],
            showTags: false,
            onTap: () =>
                Dependencies.instance.navigator.openProduct(products[i]),
          );
        },
        childCount: products.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        crossAxisCount: 2,
        childAspectRatio: 16 / 9,
      ),
    );
  }
}
