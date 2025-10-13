import 'package:sqflite/sqlite_api.dart';

import 'package:projeto_923/db/DB_helper.dart';
import '../domain/pergunta.dart';

class PerguntaDao {
  Future<List<Pergunta>> carregarPerguntas(int quant_perguntas) async {
    Database db = await QuizDBHelper().initDB();

    var perguntasResult = await db.rawQuery('  SELECT * FROM Pergunta ORDER BY RANDOM() LIMIT ${quant_perguntas};');

    print(perguntasResult);
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