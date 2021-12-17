import 'package:redux/redux.dart';
import 'package:shop_flutter_app/redux/cart_page/state.dart';

import 'actions.dart';

final Reducer<CartPageState> cartPageReducer = combineReducers<CartPageState>([
  TypedReducer<CartPageState, SetCartItemsListAction>(_setFeedItemsAction),
]);

CartPageState _setFeedItemsAction(
        CartPageState state, SetCartItemsListAction action) =>
    state.copyWith(items: action.items);
