import 'package:cozinhando_casa/modelos/receita.dart';
import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  final Receita receita;

  const Detalhes({Key? key, required this.receita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirDetalhes() {
    return Scaffold(
      body: ListView(
        children: [
          _construirImagemDetalhes(receita.foto),
          _construirTituloDetalhes(receita.titulo),
          _construirLinhaIconesDetalhes(
              rendimento: '${receita.porcoes} porções',
              tempoPreparo: receita.tempoPreparo),
          _construirSubTituloDetalhes('Ingredientes'),
          _construirtextoDetalhes(receita.ingredientes),
          _construirSubTituloDetalhes('Modo de Preparo'),
          _construirtextoDetalhes(receita.modoPreparo),
        ],
      ),
      appBar: _construirAppBar(),
    );
  }

  Widget _construirImagemDetalhes(String imagem) {
    return Image.asset(imagem);
  }

  Widget _construirTituloDetalhes(String titulo) {
    return Center(
      child: Text(
        titulo,
        style: const TextStyle(
          color: Colors.deepOrange,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget _construirLinhaIconesDetalhes(
      {required String rendimento, required String tempoPreparo}) {
    return Row(
      children: [
        _construirColunaIconeDetalhes(
            icone: Icons.restaurant, texto: rendimento),
        _construirColunaIconeDetalhes(
          icone: Icons.timer,
          texto: tempoPreparo,
        ),
      ],
    );
  }

  Widget _construirColunaIconeDetalhes(
      {required IconData icone, required String texto}) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icone,
            color: Colors.deepOrange,
          ),
          Text(
            texto,
            style: const TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _construirSubTituloDetalhes(String titulo) {
    return Center(
      child: Text(
        titulo,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _construirtextoDetalhes(String texto) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        texto,
        textAlign: TextAlign.justify,
      ),
    );
  }

  PreferredSizeWidget? _construirAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text('Cozinhando em Casa'),
    );
  }
}
