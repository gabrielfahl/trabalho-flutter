import 'package:flutter/material.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/detalhes_produto_screen.dart';
import 'package:myapp/models/produto.dart';
import 'package:myapp/routes.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.detalhesProduto:
        final produto = settings.arguments as Produto;
        return MaterialPageRoute(
          builder: (_) => DetalhesProdutoScreen(produto: produto),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Rota não encontrada: \'${settings.name}\''),
            ),
          ),
        );
    }
  }
}
