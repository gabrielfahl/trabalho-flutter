import 'package:flutter/foundation.dart';
import 'package:myapp/models/produto.dart';

class CarrinhoProvider with ChangeNotifier {
  final List<Produto> _itensCarrinho = [];

  List<Produto> get itensCarrinho => [..._itensCarrinho];

  double get totalCompra {
    return _itensCarrinho.fold(0.0, (sum, item) => sum + item.preco);
  }

  void adicionarAoCarrinho(Produto produto) {
    _itensCarrinho.add(produto);
    notifyListeners();
  }

  void limparCarrinho() {
    _itensCarrinho.clear();
    notifyListeners();
  }
}