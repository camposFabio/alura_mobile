import 'package:flutter/material.dart';
import 'package:lojinha_alura/modelos/movel.dart';
import 'package:lojinha_alura/widgets/elemento_grid_produtos.dart';

class GridProdutos extends StatelessWidget {
  final List moveis;
  final Function atualiza;

  const GridProdutos({
    Key? key,
    required this.moveis,
    required this.atualiza,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: moveis.length,
      itemBuilder: (BuildContext conteste, int indice) {
        final movel = Movel.fromJson(moveis[indice]);

        return ElementoGridProdutos(
          movel: movel,
          atualiza: atualiza,
        );
      },
    );
  }
}
