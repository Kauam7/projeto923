class Noticia {
  final String titulo;
  final String descricao;
  final String url;
  final String urlImagem;
  final String fonte;

  Noticia({
    required this.titulo,
    required this.descricao,
    required this.url,
    required this.urlImagem,
    required this.fonte,
  });

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      titulo: json['title'] ?? 'Sem título',
      descricao: json['description'] ?? 'Sem descrição',
      url: json['url'] ?? '',
      urlImagem: json['urlToImage'] ?? '',
      fonte: json['source']?['name'] ?? 'Fonte desconhecida',
    );
  }
}