import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha_alura/main.dart';
import 'package:lojinha_alura/modelos/item_carrinho.dart';
import 'package:lojinha_alura/modelos/movel.dart';

class ListaCarrinho extends StatefulWidget {
  final Function atualiza;

  const ListaCarrinho({Key? key, required this.atualiza}) : super(key: key);

  @override
  State<ListaCarrinho> createState() => _ListaCarrinhoState();
}

class _ListaCarrinhoState extends State<ListaCarrinho> {
  final List<ItemCarrinho> carrinho = Inicio.itensCarrinho;

  final formatacaoReais = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: carrinho.length,
        itemBuilder: (BuildContext context, int indice) {
          ItemCarrinho item = carrinho[indice];
          Movel movel = item.movel;

          return Container(
            margin: const EdgeInsets.all(16),
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: Row(
                children: [
                  Expanded(
                    child: Image(
                      image: AssetImage('assets/imagens/${movel.foto}'),
                      height: 92,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 92,
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movel.titulo,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(formatacaoReais.format(movel.preco)),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => _aumentarQuantidade(item),
                                    child: Container(
                                      margin: const EdgeInsets.all(8),
                                      child: const Icon(Icons.add, size: 14),
                                    ),
                                  ),
                                  Text('${item.quantidade}'),
                                  GestureDetector(
                                    onTap: () => _diminuitQuantidade(item),
                                    child: Container(
                                      margin: const EdgeInsets.all(8),
                                      child: const Icon(Icons.remove, size: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _aumentarQuantidade(ItemCarrinho item) {
    setState(() {
      item.quantidade++;
      widget.atualiza();
    });
  }

  void _diminuitQuantidade(ItemCarrinho item) {
    if (item.quantidade > 1) {
      setState(() {
        item.quantidade--;
        widget.atualiza();
      });
    } else {
      _removerMovel(item);
    }
  }

  void _removerMovel(ItemCarrinho item) {
    setState(() {
      Inicio.itensCarrinho.remove(item);
      widget.atualiza();
    });
  }
}
