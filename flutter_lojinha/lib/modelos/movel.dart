class Movel {
  late String titulo;
  late String foto;
  late String descricao;

  late double preco;

  Movel(this.titulo, this.foto, this.descricao, this.preco);

  Movel.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    foto = json['foto'];
    descricao = json['descricao'];
    preco = json['preco'].toDouble();
  }
}
