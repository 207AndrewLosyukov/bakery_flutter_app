import 'package:shop_flutter_app/redux/cart_page/state.dart';

class GlobalState {
  static final GlobalState initState = GlobalState(
    cartPage: CartPageState.initState,
  );

  final CartPageState cartPage;

  const GlobalState({
    required this.cartPage,
  });
}
