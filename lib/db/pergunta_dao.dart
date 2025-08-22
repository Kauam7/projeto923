import 'package:sqflite/sqlite_api.dart';

import '../db_helper.dart';
import '../domain/pergunta.dart';

class PerguntaDao {
  Future<List<Pergunta>> carregarPerguntas() async {
    Database db = await QuizDBHelper().initDB();

    var perguntasResult = await db.rawQuery('SELECT * FROM Pergunta;');
    if (perguntasResult.isEmpty) {
      throw Exception('Nenhuma pergunta encontrada');
    }

    List<Pergunta> listaPerguntas = [];

    for (var json in perguntasResult) {
      Pergunta pergunta = Pergunta.fromJson(json);
      listaPerguntas.add(pergunta);
    }

    return listaPerguntas;
  }
}