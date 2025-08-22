import 'dbhelp.dart';
import 'tarefas.dart';
import 'package:sqflite/sqflite.dart';

class TarefaDao {
  Future<void> salvar(Tarefa tarefa) async {
    final db = await DBHelper().database;
    await db.insert('tarefas', tarefa.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Tarefa>> listarTarefasDoDia(String data) async {
    final db = await DBHelper().database;
    final result = await db.query(
      'tarefas',
      where: 'data = ? AND concluida = 0',
      whereArgs: [data],
    );
    return result.map((map) => Tarefa.fromMap(map)).toList();
  }

  Future<void> atualizar(Tarefa tarefa) async {
    final db = await DBHelper().database;
    await db.update(
      'tarefas',
      tarefa.toMap(),
      where: 'id = ?',
      whereArgs: [tarefa.id],
    );
  }
}
