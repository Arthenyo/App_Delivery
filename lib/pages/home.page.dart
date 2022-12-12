import 'package:app_delivery/components/badge.dart';
import 'package:app_delivery/components/produto.itens.dart';
import 'package:app_delivery/models/cart.dart';
import 'package:app_delivery/models/produto.dart';
import 'package:app_delivery/pages/cart.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/produto_list.dart';

enum FilterOption {
  Favorito,
  All,
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProdutoList>(context);
    final List<Produto> carregarproduto = provider.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Top delivery'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente Farvorito'),
                value: FilterOption.Favorito,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOption.All,
              ),
            ],
            onSelected: (FilterOption SelectedValue) {
              if (SelectedValue == FilterOption.Favorito) {
                provider.showFavoriteonly();
              } else {
                provider.showAll();
              }
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => CartPage())));
              },
              icon: Icon(Icons.shopping_cart),
            ),
            builder: (ctx, cart, child) => Badge(
              value: cart.itemsCaunt.toString(),
              child: child!,
            ),
          ),
        ],
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: carregarproduto.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider(
                create: (_) => carregarproduto[i],
                child: produtoitem(),
              ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          )),
    );
  }
}
