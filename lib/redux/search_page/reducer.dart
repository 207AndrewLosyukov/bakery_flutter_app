import 'package:redux/redux.dart';
import 'package:shop_flutter_app/redux/search_page/state.dart';

import 'actions.dart';

final Reducer<SearchPageState> searchPageReducer =
    combineReducers<SearchPageState>([
  TypedReducer<SearchPageState, SetSearchResultsAction>(_setSearchResultAction),
  TypedReducer<SearchPageState, SetLoadingAction>(_setLoadingAction),
  TypedReducer<SearchPageState, SetErrorAction>(_setErrorAction),
]);

SearchPageState _setSearchResultAction(
        SearchPageState state, SetSearchResultsAction action) =>
    state.copyWith(
      results: action.results,
      isLoading: false,
      isError: false,
    );

SearchPageState _setLoadingAction(
        SearchPageState state, SetLoadingAction action) =>
    state.copyWith(
      isLoading: true,
    );

SearchPageState _setErrorAction(
        SearchPageState state, SetErrorAction action) =>
    state.copyWith(
      isLoading: false,
      isError: true,
    );
