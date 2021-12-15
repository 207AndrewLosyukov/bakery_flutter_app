import 'package:shop_flutter_app/models/product.dart';

class MainPageState {
  static const initState = MainPageState(
    items: [],
    isLoaded: false,
  );

  final bool isLoaded;
  final List<Product> items;

  const MainPageState({
    required this.isLoaded,
    required this.items,
  });

  MainPageState copyWith({
    List<Product>? items,
    bool? isLoaded,
  }) =>
      MainPageState(
        items: items ?? this.items,
        isLoaded: isLoaded ?? this.isLoaded,
      );
}
