import 'package:shop_flutter_app/models/product.dart';

class SetSearchResultsAction {
  final List<Product> results;

  SetSearchResultsAction(this.results);
}

class SetLoadingAction {}

class SetErrorAction {}
