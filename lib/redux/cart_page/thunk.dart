import 'dart:developer';

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/cart_product.dart';
import 'package:shop_flutter_app/redux/cart_page/actions.dart';

import '../state.dart';

class IncreaseNumberOfProducts
    extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {
  final int index;

  IncreaseNumberOfProducts(this.index);

  @override
  call(Store<GlobalState> store, Dependencies extraArgument) {
    final items = store.state.cartPage.items.toList();
    final item = items[index];
    log(item.amount.toString());
    final newItem = item.copyWith(amount: item.amount + 1);
    log(newItem.amount.toString());
    items[index] = newItem;
    store.dispatch(SetCartItemsListAction(items));
  }
}

class DecreaseNumberOfProducts
    extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {
  final int index;

  DecreaseNumberOfProducts(this.index);

  @override
  call(Store<GlobalState> store, Dependencies extraArgument) {
    final items = store.state.cartPage.items.toList();
    final item = items[index];
    final newItem = item.copyWith(amount: item.amount - 1);
    items[index] = newItem;
    store.dispatch(SetCartItemsListAction(items));
  }
}

class ClearCart
    extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {

  ClearCart();

  @override
  call(Store<GlobalState> store, Dependencies extraArgument) {
    final items = store.state.cartPage.items.toList();
    items.clear();
    store.dispatch(SetCartItemsListAction(items));
  }
}

// class SubmitOrder
//     extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {
//   final
//   SubmitOrder()
// }
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
