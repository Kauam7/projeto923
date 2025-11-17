class Tarefa {
  late int id;
  late String descricao;
  late String data;
  late bool concluida;

  Tarefa({
    required this.id,
    required this.descricao,
    required this.data,
    required this.concluida,
  });

  Tarefa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    data = json['data'];
    concluida = json['concluida'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['data'] = this.data;
    data['concluida'] = this.concluida;
    return data;
  }
}
