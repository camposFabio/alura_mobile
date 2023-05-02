import 'package:flutter/material.dart';
import 'package:lojinha_alura/modelos/movel.dart';
import 'package:lojinha_alura/paginas/detalhes.dart';
import 'package:lojinha_alura/widgets/degrade_elementos_grid_produtos.dart';
import 'package:lojinha_alura/widgets/imagem_elemento_grid_produtos.dart';
import 'package:lojinha_alura/widgets/titulo_elemento_grid_produtos.dart';

class ElementoGridProdutos extends StatefulWidget {
  final Movel movel;
  final Function atualiza;

  const ElementoGridProdutos({
    Key? key,
    required this.movel,
    required this.atualiza,
  }) : super(key: key);

  @override
  State<ElementoGridProdutos> createState() => _ElementoGridProdutosState();
}

class _ElementoGridProdutosState extends State<ElementoGridProdutos> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detalhes(
              movel: widget.movel,
            ),
          ),
        ).then((value) => widget.atualiza());
      },
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 8,
              color: Colors.black12,
            )
          ],
        ),
        margin: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ImagemElementoGridProdutos(
                imagem: widget.movel.foto,
              ),
              const DegradeElementoGridProdutos(),
              TituloElementoGridProdutos(
                titulo: widget.movel.titulo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
