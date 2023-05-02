import 'dart:convert';

import 'package:cozinhando_casa/telas/detalhes/detalhes.dart';
import 'package:flutter/material.dart';
import 'package:cozinhando_casa/modelos/receita.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(
      appBar: _construirAppBar(),
      body: SafeArea(child: _construirListaCart()),
    );
  }

  Widget _construirListaCart() {
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/receitas.json'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            List<dynamic> receitas = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: receitas.isEmpty ? 0 : receitas.length,
              itemBuilder: (BuildContext context, int index) {
                Receita receita = Receita.fromJson(receitas[index]);

                return _construirCard(receita: receita);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _construirCard({required Receita receita}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detalhes(
              receita: receita,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 300,
        child: Card(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Stack(
                children: [
                  _construirImagemCard(foto: receita.foto),
                  _construirGradienteCard(),
                  _construirTextoCard(titulo: receita.titulo),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirGradienteCard() {
    return Container(
      height: 268,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        colors: [Colors.transparent, Colors.deepOrange.withOpacity(0.7)],
      )),
    );
  }

  Widget _construirTextoCard({required String titulo}) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(
        titulo,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _construirImagemCard({required String foto}) {
    return Image.asset(
      foto,
      fit: BoxFit.fill,
      height: 268,
    );
  }

  PreferredSizeWidget? _construirAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text('Cozinhando em Casa'),
    );
  }
}
