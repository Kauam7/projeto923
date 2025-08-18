import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'perguntas.dart';

class QuizDBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'quiz.db';
    String dbPath = join(path, dbName);

    var db = await openDatabase(dbPath, version: 1, onCreate: onCreate);
    return db;
  }

  Future<void> onCreate(Database db, int version) async {

    String sql = '''CREATE TABLE Pergunta (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      texto TEXT NOT NULL,
      respostaCorreta INTEGER NOT NULL ,
      alt1 TEXT NOT NULL,
      alt2 TEXT NOT NULL,
      alt3 TEXT NOT NULL,
      alt4 TEXT NOT NULL
    );''';
    await db.execute(sql);

    await _insertInitialData(db);
  }

  Future<void> _insertInitialData(Database db) async {

    await db.rawInsert('''
    INSERT INTO Pergunta (
      texto, 
      respostaCorreta,
      alt1,
      alt2,
      alt3,
      alt4
    ) VALUES (
      'Qual é a capital do Brasil?',
      3,
      'Porto Alegre',
      'Belo Horizonte',
      'Brasília',
      'Recife'
    )
  ''');
  }
}
