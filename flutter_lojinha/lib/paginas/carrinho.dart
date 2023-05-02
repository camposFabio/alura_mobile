import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha_alura/main.dart';
import 'package:lojinha_alura/widgets/appbar_customizado.dart';
import 'package:lojinha_alura/widgets/lista_carrinho.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({Key? key}) : super(key: key);

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  final formatacaoReais = NumberFormat.currency(locale: 'pt-BR', symbol: 'R\$');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double valorTotal = _calcularTotal();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBarCustomizada(
        titulo: 'Carrinho',
        ePaginaCarrinho: true,
      ),
      body: ListaCarrinho(
        atualiza: _atualiza,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              formatacaoReais.format(valorTotal),
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }

  void _atualiza() {
    setState(() {});
  }

  double _calcularTotal() {
    if (Inicio.itensCarrinho.isNotEmpty) {
      return Inicio.itensCarrinho
          .map((item) => item.movel.preco * item.quantidade)
          .reduce((precoAtual, precoNovo) => precoAtual + precoNovo);
    } else {
      return 0;
    }
  }
}
