import 'package:shop_flutter_app/redux/cart_page/state.dart';
import 'package:shop_flutter_app/redux/main_page/state.dart';

class GlobalState {
  static GlobalState initState = GlobalState(
    cartPage: CartPageState.initState,
    mainPage: MainPageState.initState,
  );

  final CartPageState cartPage;
  final MainPageState mainPage;

  const GlobalState({
    required this.cartPage,
    required this.mainPage,
  });
}
