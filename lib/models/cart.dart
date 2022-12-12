import 'dart:math';

import 'package:app_delivery/models/cart_items.dart';
import 'package:app_delivery/models/produto.dart';
import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCaunt {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, CartItem) {
      total += CartItem.price * CartItem.quantidade;
    });
    return total;
  }

  void addItems(Produto produto) {
    if (_items.containsKey(produto.id)) {
      _items.update(
        produto.id,
        (existengItem) => CartItem(
          id: existengItem.id,
          produtoID: existengItem.produtoID,
          name: existengItem.name,
          quantidade: existengItem.quantidade + 1,
          price: existengItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        produto.id,
        () => CartItem(
            id: Random().nextDouble().toString(),
            produtoID: produto.id,
            name: produto.nome,
            quantidade: 1,
            price: produto.preco),
      );
    }
    notifyListeners();
  }

  void romeveItem(String produtoId) {
    _items.remove(produtoId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
