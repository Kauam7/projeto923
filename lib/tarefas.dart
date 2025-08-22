class Tarefa {
  int? id;
  String descricao;
  String data; // YYYY-MM-DD
  bool concluida;

  Tarefa({
    this.id,
    required this.descricao,
    required this.data,
    this.concluida = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'data': data,
      'concluida': concluida ? 1 : 0,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'],
      descricao: map['descricao'],
      data: map['data'],
      concluida: map['concluida'] == 1,
    );
  }
}
