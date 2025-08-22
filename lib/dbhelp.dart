import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'autocuidado.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tarefas (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            descricao TEXT NOT NULL,
            data TEXT NOT NULL,
            concluida INTEGER NOT NULL
          )
        ''');
      },
    );
  }
}
