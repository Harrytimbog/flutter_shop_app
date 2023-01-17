import 'package:flutter/foundation.dart';

class Cartitem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  const Cartitem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  late Map<String, Cartitem> _items;

  Map<String, Cartitem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      //
      _items.update(
          productId,
          (existingCartItem) => Cartitem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
        productId,
        () => Cartitem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
  }
}
