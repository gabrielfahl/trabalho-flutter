import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/provider/produto_provider.dart';
import 'package:myapp/provider/carrinho_provider.dart';
import 'package:myapp/routes/route_generator.dart';
import 'package:myapp/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProdutoProvider()),
        ChangeNotifierProvider(create: (_) => CarrinhoProvider()),
      ],
      child: MaterialApp(
        title: 'Mercado Halloween Cabuloso',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
          cardColor: Colors.white,
        ),
        initialRoute: Routes.home,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
