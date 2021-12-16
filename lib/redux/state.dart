import 'package:shop_flutter_app/redux/auth_page/state.dart';
import 'package:shop_flutter_app/redux/cart_page/state.dart';
import 'package:shop_flutter_app/redux/main_page/state.dart';

class GlobalState {
  static final GlobalState initState = GlobalState(
    cartPage: CartPageState.initState,
    mainPage: MainPageState.initState,
    authPage: AuthPageState.initState,
  );

  final CartPageState cartPage;
  final MainPageState mainPage;
  final AuthPageState authPage;

  const GlobalState({
    required this.cartPage,
    required this.mainPage,
    required this.authPage,
  });
}
