import 'package:shop_flutter_app/models/product.dart';

class SetDownloadListAction {
  final List<Product> items;

  SetDownloadListAction(this.items);
}

class SetIsLoadedAction {
  bool isLoaded;

  SetIsLoadedAction(this.isLoaded);
}
