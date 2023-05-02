import 'package:lojinha_alura/modelos/movel.dart';

class ItemCarrinho {
  final Movel movel;
  int quantidade;

  ItemCarrinho({required this.movel, this.quantidade = 0});
}
