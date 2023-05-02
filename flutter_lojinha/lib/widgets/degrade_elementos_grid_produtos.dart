import 'package:flutter/material.dart';

class DegradeElementoGridProdutos extends StatelessWidget {
  const DegradeElementoGridProdutos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Theme.of(context).primaryColor,
            ]),
      ),
    );
  }
}
