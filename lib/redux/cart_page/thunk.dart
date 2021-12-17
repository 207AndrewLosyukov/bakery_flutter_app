import 'dart:developer';

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shop_flutter_app/components/cart/cart_item.dart';
import 'package:shop_flutter_app/components/cart/cart_items_list.dart';
import 'package:shop_flutter_app/database/dao.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/cart_product.dart';
import 'package:shop_flutter_app/models/product.dart';
import 'package:shop_flutter_app/redux/cart_page/actions.dart';

import '../state.dart';

int? _getCartProductIndexById(String id, List<CartProduct> items) {
  for (int i = 0; i < items.length; ++i) {
    if (items[i].product.id == id) {
      return i;
    }
  }
  return null;
}

class InsertProduct extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {
  final Product product;

  InsertProduct(this.product);

  @override
  call(Store<GlobalState> store, Dependencies extraArgument) {
    final items = store.state.cartPage.items.toList();
    CartProduct item = CartProduct(amount: 1, product: product);
    extraArgument.cartProductDao.putCartProduct(item);
    items.add(item);
    store.dispatch(SetCartItemsListAction(items));
  }
}

class IncreaseNumberOfProducts
    extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {
  final String id;

  IncreaseNumberOfProducts(this.id);

  @override
  call(Store<GlobalState> store, Dependencies extraArgument) {
    final items = store.state.cartPage.items.toList();
    final item = extraArgument.cartProductDao.getCartProductById(id);
    extraArgument.cartProductDao.deleteCartProductById(id);
    if (item != null) {
      final newItem = item.copyWith(amount: item.amount + 1);
      extraArgument.cartProductDao.putCartProduct(newItem);
      items[_getCartProductIndexById(newItem.product.id, items)!] = newItem;
    }
    store.dispatch(SetCartItemsListAction(items));
  }
}

class DecreaseNumberOfProducts
    extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {
  final String id;

  DecreaseNumberOfProducts(this.id);

  @override
  call(Store<GlobalState> store, Dependencies extraArgument) {
    final items = store.state.cartPage.items.toList();
    final item = extraArgument.cartProductDao.getCartProductById(id);
    extraArgument.cartProductDao.deleteCartProductById(id);
    if (item != null) {
      final newItem = item.copyWith(amount: item.amount - 1);
      extraArgument.cartProductDao.putCartProduct(newItem);
      store.dispatch(SetCartItemsListAction(items));
      items[_getCartProductIndexById(newItem.product.id, items)!] = newItem;
      if (item.amount <= 1) {
        store.dispatch(DeleteProduct(id));
      } else {
        store.dispatch(SetCartItemsListAction(items));
      }
    }
  }
}

class DeleteProduct
    extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {
  final String id;

  DeleteProduct(this.id);

  @override
  call(Store<GlobalState> store, Dependencies extraArgument) {
    final items = store.state.cartPage.items.toList();
    int? index = _getCartProductIndexById(id, items);
    if (index != null) {
      items.removeAt(index);
      extraArgument.cartProductDao.deleteCartProductById(id);
      store.dispatch(SetCartItemsListAction(items));
    }
  }
}

class ClearCart
    extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {

  ClearCart();

  @override
  call(Store<GlobalState> store, Dependencies extraArgument) {
    final items = store.state.cartPage.items.toList();
    items.clear();
    for (final i in extraArgument.cartProductDao.getCartProductList()) {
      extraArgument.cartProductDao.deleteCartProductById(i.product.id);
    }
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
