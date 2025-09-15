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
      where: 'data = ? And concluida = 0',
      whereArgs: [data],
    );

    return result.map((map) => Tarefa.fromMap(map)).toList();
  }
  Future<List<Tarefa>> garantirTarefasDodia(String data) async {
    List<Tarefa> tarefas = await listarTarefasDoDia(data);

    if (tarefas.isEmpty) {
      await salvar(Tarefa(descricao: "Caminhei 10 minutos ou mais.", data: data));
      await salvar(Tarefa(descricao: "Tome 2L ou mais de água!", data: data));
      await salvar(Tarefa(descricao: "Anotei algo positivo hoje!", data: data));
      tarefas = await listarTarefasDoDia(data);
    }
    return tarefas;
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
