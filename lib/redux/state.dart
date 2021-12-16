import 'package:shop_flutter_app/redux/cart_page/state.dart';
import 'package:shop_flutter_app/redux/main_page/state.dart';
import 'package:shop_flutter_app/redux/search_page/state.dart';

class GlobalState {
  static final GlobalState initState = GlobalState(
    cartPage: CartPageState.initState,
    mainPage: MainPageState.initState,
    searchPage: SearchPageState.initState,
  );

  final CartPageState cartPage;
  final MainPageState mainPage;
  final SearchPageState searchPage;

  const GlobalState({
    required this.cartPage,
    required this.mainPage,
    required this.searchPage,
  });
}
