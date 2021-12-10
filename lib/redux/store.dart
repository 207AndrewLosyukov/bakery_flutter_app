import 'package:redux/redux.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/redux/state.dart';
import 'package:redux_thunk/redux_thunk.dart';

class MyStoreBuilder {
  MyStoreBuilder._();

  static Store<GlobalState> build() =>
      Store<GlobalState>(
        _globalReducer,
        initialState: GlobalState.initState,
        middleware: [
          ExtraArgumentThunkMiddleware(Dependencies.instance),
          // TypedMiddleware<GlobalState, MainPageAction>(
          //     MainPageMiddleware(workerProvider)),
        ],
      );
}

GlobalState _globalReducer(GlobalState state, action) => GlobalState(
  // mainPage: mainPageReducer(state.mainPage, action),
);

// final mainPageReducer = combineReducers<MainPageState>([
//   TypedReducer<MainPageState, SetFeedItemsAction>(_setFeedItemsAction),
//   TypedReducer<MainPageState, SetIsProgressAction>(_setIsProgressAction),
//   TypedReducer<MainPageState, SetHasErrorAction>(_setHasErrorAction),
// ]);
//
// MainPageState _setFeedItemsAction(
//     MainPageState state, SetFeedItemsAction action) =>
//     state.copyWith(items: action.items, favoriteItems: action.favoriteItems);
