import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
      a TEXT NOT NULL,
      b TEXT NOT NULL,
      c TEXT NOT NULL,
      d TEXT NOT NULL
    );''';
    await db.execute(sql);

    await _insertInitialData(db);
  }

  Future<void> _insertInitialData(Database db) async {

    await db.rawInsert('''
    INSERT INTO Pergunta (
      texto, 
      respostaCorreta,
      a,
      b,
      c,
      d
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
