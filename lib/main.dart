import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/provider/produto_provider.dart'; // Verifique se o caminho está correto para 'provider'
import 'package:myapp/provider/carrinho_provider.dart'; // Verifique se o caminho está correto para 'provider'
import 'package:myapp/screens/home_screen.dart';

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
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}