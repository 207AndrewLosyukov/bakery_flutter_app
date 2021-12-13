import 'package:redux/redux.dart';
import 'package:shop_flutter_app/redux/main_page/state.dart';

import 'actions.dart';

final Reducer<MainPageState> mainPageReducer = combineReducers<MainPageState>([
  TypedReducer<MainPageState, OpenTabWithCartItemsListAction>(
      _openTabWithCartItemsListAction),
]);

MainPageState _openTabWithCartItemsListAction(
        MainPageState state, OpenTabWithCartItemsListAction action) =>
    state.copyWith(items: action.items);
