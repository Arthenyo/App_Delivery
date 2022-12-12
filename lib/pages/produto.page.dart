import 'package:app_delivery/models/produto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class produtodetalhe extends StatelessWidget {
  final Produto produto;

  const produtodetalhe({Key? key, required this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
      ),
    );
  }
}
