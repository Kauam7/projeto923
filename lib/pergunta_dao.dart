import 'package:sqflite/sqlite_api.dart';

import 'db_helper.dart';
import 'pergunta.dart';

class PerguntaDao {
  Future<Pergunta> carregarPergunta() async {
    Database db = await QuizDBHelper().initDB();

    // Buscar a primeira pergunta (para simplificar)
    var perguntaResult = await db.rawQuery('SELECT * FROM Pergunta LIMIT 1;');
    if (perguntaResult.isEmpty) {
      throw Exception('Nenhuma pergunta encontrada');
    }

    var pergunta = perguntaResult.first;
    var alternativasResult = await db.rawQuery(
        'SELECT * FROM Alternativa WHERE perguntaId = ?;',
        [pergunta['id']]
    );

    return Pergunta.fromJson(pergunta, alternativasResult);
  }
}