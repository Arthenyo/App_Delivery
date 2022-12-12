import 'package:app_delivery/models/cart.dart';
import 'package:app_delivery/models/produto.dart';
import 'package:app_delivery/pages/produto.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class produtoitem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final produto = Provider.of<Produto>(context);
    final cart = Provider.of<Cart>(context);

    return GridTile(
      child: GestureDetector(
        child: Image.network(
          produto.imageUrl,
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => produtodetalhe(produto: produto),
            ),
          );
        },
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        leading: IconButton(
          color: Colors.redAccent,
          onPressed: () {
            produto.efavorito();
          },
          icon: Icon(produto.favorito ? Icons.favorite : Icons.favorite_border),
        ),
        title: Text(
          produto.nome,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          onPressed: () {
            cart.addItems(produto);
          },
          icon: Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
