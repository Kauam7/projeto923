class Propriedade {
  final String termo;
  final String definicao;

  Propriedade({
    required this.termo,
    required this.definicao,
  });

  factory Propriedade.fromJson(Map<String, dynamic> json) {
    return Propriedade(
      termo: json['termo'] ?? '',
      definicao: json['definicao'] ?? '',
    );
  }
}
