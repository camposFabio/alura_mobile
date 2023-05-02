class Receita {
  late String titulo;
  late String foto;
  late String porcoes;
  late String tempoPreparo;
  late String ingredientes;
  late String modoPreparo;

  Receita(
      {required this.titulo,
      required this.foto,
      required this.porcoes,
      required this.tempoPreparo,
      required this.ingredientes,
      required this.modoPreparo});

  Receita.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    foto = json['foto'];
    porcoes = json['porcoes'];
    tempoPreparo = json['tempo_preparo'];
    ingredientes = json['ingredientes'];
    modoPreparo = json['modo_preparo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['titulo'] = titulo;
    data['foto'] = foto;
    data['porcoes'] = porcoes;
    data['tempo_preparo'] = tempoPreparo;
    data['ingredientes'] = ingredientes;
    data['modo_preparo'] = modoPreparo;
    return data;
  }
}
