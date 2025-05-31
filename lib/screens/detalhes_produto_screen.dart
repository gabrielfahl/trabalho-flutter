import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/produto.dart';
import 'package:myapp/provider/carrinho_provider.dart';

class DetalhesProdutoScreen extends StatelessWidget {
  final Produto produto;

  const DetalhesProdutoScreen({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                produto.emoji,
                style: const TextStyle(fontSize: 100),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              produto.nome,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              produto.descricao,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Preço: R\$ ${produto.preco.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 20, color: Colors.greenAccent),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Adicionar ao Carrinho'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16)
                ),
                onPressed: () {
                  Provider.of<CarrinhoProvider>(context, listen: false)
                      .adicionarAoCarrinho(produto);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${produto.nome} adicionado ao carrinho!'),
                      duration: const Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}