import 'package:flutter/material.dart';
import 'package:lojinha_alura/widgets/botao_carrinho.dart';

class AppBarCustomizada extends StatelessWidget with PreferredSizeWidget {
  final String? titulo;
  final bool ePaginaCarrinho;

  AppBarCustomizada({Key? key, this.titulo, required this.ePaginaCarrinho})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      title: (titulo != null)
          ? Text(
              titulo ?? '',
              style: const TextStyle(color: Colors.black),
            )
          : null,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      actions: <Widget>[
        _mudarPaginaCarrinho(ePaginaCarrinho),
      ],
    );
  }

  _mudarPaginaCarrinho(bool ePaginaCarrinho) {
    return ePaginaCarrinho ? Container() : BotaoCarrinho();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
