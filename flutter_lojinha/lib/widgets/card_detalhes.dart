import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha_alura/main.dart';
import 'package:lojinha_alura/modelos/item_carrinho.dart';
import 'package:lojinha_alura/modelos/movel.dart';
import 'package:lojinha_alura/widgets/texto_detalhes.dart';

class CardDetalhes extends StatefulWidget {
  final Movel movel;
  final Function atualizaPagina;

  const CardDetalhes(
      {Key? key, required this.movel, required this.atualizaPagina})
      : super(key: key);

  @override
  State<CardDetalhes> createState() => _CardDetalhesState();
}

class _CardDetalhesState extends State<CardDetalhes> {
  final formatacaoReais = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextoDetalhes(
            texto: widget.movel.titulo,
            estilo: Theme.of(context).textTheme.headline1,
          ),
          TextoDetalhes(texto: widget.movel.descricao),
          Container(
            margin: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatacaoReais.format(widget.movel.preco),
                  style: Theme.of(context).textTheme.headline1,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    _verificarListaItemCarrinho(Inicio.itensCarrinho,
                        ItemCarrinho(quantidade: 1, movel: widget.movel));
                  },
                  child: Text(
                    'Comprar',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _adicionarItemCarrinho(ItemCarrinho item) {
    setState(() {
      Inicio.itensCarrinho.add(item);
      widget.atualizaPagina();
    });
  }

  void _verificarListaItemCarrinho(
      List<ItemCarrinho> lista, ItemCarrinho item) {
    int indiceMovel = lista.indexWhere((item) => item.movel == widget.movel);

    if (indiceMovel >= 0) {
      lista[indiceMovel].quantidade++;
    } else {
      _adicionarItemCarrinho(item);
    }
  }
}
