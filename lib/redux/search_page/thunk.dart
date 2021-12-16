import 'dart:developer';

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/redux/search_page/actions.dart';

import '../state.dart';

class Search
    extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {
  final String query;

  Search(this.query);

  @override
  call(Store<GlobalState> store, Dependencies extraArgument) async {
    store.dispatch(SetLoadingAction());
    var res = await extraArgument.productsApi.getProducts();
    store.dispatch(SetSearchResultsAction(res));
  }
}
