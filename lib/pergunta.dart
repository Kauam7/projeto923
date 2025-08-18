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

  List<String> get alternativas => [a, b, c, d];
}