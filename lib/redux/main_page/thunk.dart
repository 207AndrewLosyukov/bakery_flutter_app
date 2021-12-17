import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shop_flutter_app/dependencies.dart';

import '../state.dart';
import 'actions.dart';

class DownloadList
    extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {
  DownloadList();

  @override
  call(Store<GlobalState> store, extraArgument) async {
    var items = await Dependencies.instance.productsApi.getProducts();
    store.dispatch(SetDownloadListAction(items));
    store.dispatch(SetIsLoadedAction(true));
  }
}

// class AddToFavoriteThunk
//     extends CallableThunkActionWithExtraArgument<GlobalState, WorkerProvider> {
//   final CartProduct item;

//   AddToFavoriteThunk(this.item);

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
