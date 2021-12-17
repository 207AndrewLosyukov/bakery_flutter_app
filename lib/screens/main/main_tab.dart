import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop_flutter_app/components/product_card.dart';
import 'package:shop_flutter_app/dependencies.dart';
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
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
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
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 150,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.items.length,
                        itemBuilder: (context, i) => ProductCard(
                          product: state.items[i],
                          onTap: () => Dependencies.instance.navigator
                              .openProduct(state.items[i]),
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 8,
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
                    padding: const EdgeInsets.all(12),
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
                              return buildTab2(state);
                            } else if (currentTab == 1) {
                              return buildTab1(state);
                            } else {
                              return buildTab2(state);
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

  Widget buildTab1(MainPageState state) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          return ProductCard(
            product: state.items[i],
            showTags: false,
            onTap: () =>
                Dependencies.instance.navigator.openProduct(state.items[i]),
          );
        },
        childCount: state.items.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        crossAxisCount: 2,
        childAspectRatio: 16 / 9,
      ),
    );
  }

  Widget buildTab2(state) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          return ProductCard(
            product: state.items[i],
            showTags: false,
            onTap: () =>
                Dependencies.instance.navigator.openProduct(state.items[i]),
          );
        },
        childCount: state.items.length,
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
