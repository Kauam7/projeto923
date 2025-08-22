class Pergunta {
  late int id;
  late String texto;
  late int respostaCorreta;
  late String a;
  late String b;
  late String c;
  late String d;

  Pergunta({
    required this.id,
    required this.texto,
    required this.respostaCorreta,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
  });

  Pergunta.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    texto = json['texto'] as String;
    respostaCorreta = json['respostaCorreta'] as int;
    a = json['a'] as String;
    b = json['b'] as String;
    c = json['c'] as String;
    d = json['d'] as String;
  }
}