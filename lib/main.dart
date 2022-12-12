import 'package:app_delivery/models/cart.dart';
import 'package:app_delivery/models/produto_list.dart';
import 'package:app_delivery/pages/login.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProdutoList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TOP Delivery',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: LoginPage(),
      ),
    );
  }
}
