import 'package:flutter/cupertino.dart';

class Produto with ChangeNotifier {
  final String id;
  final String nome;
  final String descricao;
  final double preco;
  final String imageUrl;
  bool favorito;

  Produto(
      {required this.id,
      required this.nome,
      required this.descricao,
      required this.preco,
      required this.imageUrl,
      this.favorito = false});

  void efavorito() {
    favorito = !favorito;
    notifyListeners();
  }
}
