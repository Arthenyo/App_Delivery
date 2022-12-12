import 'package:app_delivery/data/lista.dart';
import 'package:app_delivery/models/produto.dart';
import 'package:app_delivery/pages/home.page.dart';
import 'package:flutter/cupertino.dart';

class ProdutoList with ChangeNotifier {
  List<Produto> _items = lista;

  bool _showFavoriteonly = false;

  List<Produto> get items {
    if (_showFavoriteonly) {
      return _items.where((Prod) => Prod.favorito).toList();
    }
    return [..._items];
  }

  void showFavoriteonly() {
    _showFavoriteonly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteonly = false;
    notifyListeners();
  }

  void addProduto(Produto produto) {
    _items.add(produto);
    notifyListeners();
  }
}
