import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/provider/produto_provider.dart';
import 'package:myapp/routes.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final produtoProvider = Provider.of<ProdutoProvider>(context);
    final produtos = produtoProvider.produtos;

    if (produtos.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: produtos.length,
      itemBuilder: (ctx, index) {
        final produto = produtos[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Text(
              produto.emoji,
              style: const TextStyle(fontSize: 30, color: Colors.black),
            ),
            title: Text(
              produto.nome,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.detalhesProduto,
                arguments: produto,
              );
            },
          ),
        );
      },
    );
  }
}
