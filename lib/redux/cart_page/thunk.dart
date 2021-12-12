import 'dart:html';

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shop_flutter_app/models/cart_product.dart';

import '../state.dart';

class IncreaseNumberOfProducts
    extends CallableThunkActionWithExtraArgument<GlobalState, WorkerProvider> {
  final CartProduct item;

  IncreaseNumberOfProducts(this.item);

  @override
  call(Store<GlobalState> store, extraArgument) {
    throw UnimplementedError();
  }
}

// class AddToFavoriteThunk
//     extends CallableThunkActionWithExtraArgument<GlobalState, WorkerProvider> {
//   final CartProduct item;
//
//   AddToFavoriteThunk(this.item);
//
//   @override
//   call(Store<GlobalState> store, WorkerProvider extraArgument) {
//     final feedWorker = extraArgument.feedWorker;
//     feedWorker.addToFavorites(item);
//     final items = Map.of(store.state.cartPage.items);
//     items[item] = true;
//     final favoriteItems = Map.of(store.state.cartPage.favoriteItems);
//     favoriteItems[item] = true;
//     store.dispatch(
//         SetFeedItemsAction(items: items, favoriteItems: favoriteItems));
//   }
// }
//
// class RemoveFromFavoritesThunk
//     extends CallableThunkActionWithExtraArgument<GlobalState, WorkerProvider> {
//   final FeedItem item;
//
//   RemoveFromFavoritesThunk(this.item);
//
//   @override
//   call(Store<GlobalState> store, WorkerProvider extraArgument) {
//     final feedWorker = extraArgument.feedWorker;
//     feedWorker.removeFromFavorites(item);
//     final items = Map.of(store.state.mainPage.items);
//     items[item] = false;
//     final favoriteItems = Map.of(store.state.mainPage.favoriteItems);
//     favoriteItems[item] = false;
//     store.dispatch(
//         SetFeedItemsAction(items: items, favoriteItems: favoriteItems));
//   }
// }
