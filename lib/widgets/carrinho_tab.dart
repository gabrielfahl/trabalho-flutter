import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/provider/carrinho_provider.dart'; // Verifique o caminho para carrinho_provider

class CarrinhoTab extends StatelessWidget {
  const CarrinhoTab({super.key});

  @override
  Widget build(BuildContext context) {
    final carrinhoProvider = Provider.of<CarrinhoProvider>(context);
    final itensCarrinho = carrinhoProvider.itensCarrinho;

    const TextStyle estiloTextoPreto = TextStyle(color: Colors.black);
    final TextStyle estiloTituloPreto =
        Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontSize: 22, // Mantendo o fontSize do original
                ) ??
            const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold);

    final TextStyle estiloCorpoTextoPreto =
        Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black,
                ) ??
            estiloTextoPreto;
            
    final TextStyle estiloNomeItemPreto =
        Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.black,
                ) ??
            const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
            
    final TextStyle estiloPrecoItemPreto =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ) ??
            estiloTextoPreto;


    return Column(
      children: <Widget>[
        Expanded(
          child: itensCarrinho.isEmpty
              ? Center(
                  child: Text(
                    'Seu carrinho está vazio! 🎃',
                    style: estiloCorpoTextoPreto,
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: itensCarrinho.length,
                  itemBuilder: (ctx, index) {
                    final item = itensCarrinho[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: Text(
                          item.emoji,
                          style: const TextStyle(fontSize: 24, color: Colors.black), // ALTERADO
                        ),
                        title: Text(
                          item.nome,
                          style: estiloNomeItemPreto, // ALTERADO
                        ),
                        trailing: Text(
                          'R\$ ${item.preco.toStringAsFixed(2)}',
                          style: estiloPrecoItemPreto, // ALTERADO
                        ),
                      ),
                    );
                  },
                ),
        ),
        if (itensCarrinho.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Total: R\$ ${carrinhoProvider.totalCompra.toStringAsFixed(2)}',
                  style: estiloTituloPreto,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    carrinhoProvider.limparCarrinho();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Compra realizada com sucesso!'), 
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.lightGreen,
                      ),
                    );
                  },
                  child: const Text('Finalizar Compra'),
                ),
              ],
            ),
          ),
    ],
    );
  }
}