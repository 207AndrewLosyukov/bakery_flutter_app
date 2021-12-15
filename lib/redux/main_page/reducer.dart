import 'package:redux/redux.dart';
import 'package:shop_flutter_app/redux/main_page/state.dart';

import 'actions.dart';

final Reducer<MainPageState> mainPageReducer = combineReducers<MainPageState>(
  [
    TypedReducer<MainPageState, SetDownloadListAction>(_downloadListAction),
    TypedReducer<MainPageState, SetIsLoadedAction>(_setIsLoaded),
  ],
);

MainPageState _downloadListAction(
        MainPageState state, SetDownloadListAction action) =>
    state.copyWith(items: action.items);

MainPageState _setIsLoaded(MainPageState state, SetIsLoadedAction action) =>
    state.copyWith(isLoaded: action.isLoaded);
