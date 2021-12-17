import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop_flutter_app/components/product_card.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/redux/search_page/state.dart';
import 'package:shop_flutter_app/redux/search_page/thunk.dart';
import 'package:shop_flutter_app/redux/state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Dependencies.instance.store.dispatch(Search(''));
  }

  void onChanged(String text) {
    Dependencies.instance.store.dispatch(Search(text));
  }

  void retry() {
    Dependencies.instance.store.dispatch(Search(textController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Поиск'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CupertinoTextField(
              autofocus: true,
              onChanged: onChanged,
              controller: textController,
              padding: const EdgeInsets.all(12),
              placeholder: "Например, круассан",
            ),
          ),
          StoreConnector<GlobalState, SearchPageState>(
            distinct: true,
            converter: (store) => store.state.searchPage,
            builder: (context, state) {
              if (state.isLoading) {
                return const Expanded(
                    child: Center(child: CupertinoActivityIndicator()));
              }
              if (state.isError) {
                return Expanded(
                  child: Center(
                    child: TextButton(
                      child: const Text("Попробовать снова"),
                      onPressed: retry,
                    ),
                  ),
                );
              }
              if (state.results.isEmpty) {
                return const Expanded(
                  child: Center(
                    child: Text("Ничего не нашлось :("),
                  ),
                );
              }
              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 16 / 10,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, i) {
                    return ProductCard(
                      product: state.results[i],
                      showTags: false,
                      onTap: () => Dependencies.instance.navigator.openProduct(state.results[i]),
                    );
                  },
                  itemCount: state.results.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
