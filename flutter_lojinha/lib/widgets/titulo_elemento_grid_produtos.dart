import 'package:flutter/material.dart';

class TituloElementoGridProdutos extends StatelessWidget {
  final String titulo;

  const TituloElementoGridProdutos({Key? key, required this.titulo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Text(
        titulo,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
