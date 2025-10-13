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
    INSERT INTO Pergunta (texto, respostaCorreta, a, b, c, d) VALUES
("O que é câncer?", 2, "Uma doença infecciosa", "Um crescimento descontrolado de células", "Uma alergia grave", "Um vírus que afeta o sangue"),
("Qual é o tipo de câncer mais comum entre mulheres?", 2, "Câncer de pulmão", "Câncer de mama", "Câncer de pele", "Câncer de fígado"),
("Qual exame é usado para detectar câncer de próstata?", 3, "Mamografia", "Colonoscopia", "PSA", "Endoscopia"),
("Qual hábito aumenta o risco de câncer de pulmão?", 2, "Exercício físico", "Fumar", "Beber água", "Dormir cedo"),
("O câncer pode ser hereditário?", 2, "Não, nunca", "Sim, em alguns casos", "Apenas em homens", "Apenas em idosos"),
("Qual é a função da quimioterapia?", 3, "Reduzir a dor", "Estimular o apetite", "Destruir células cancerígenas", "Fortalecer os músculos"),
("O que significa 'metástase'?", 3, "Cura completa do câncer", "Crescimento de cabelo após tratamento", "Disseminação do câncer para outras partes do corpo", "Redução do tumor"),
("Qual exame é indicado para detectar câncer de colo do útero?", 2, "Ultrassom abdominal", "Papanicolau", "Raio-X", "Tomografia"),
("Qual tipo de câncer está mais associado à exposição solar?", 1, "Câncer de pele", "Câncer de fígado", "Câncer de intestino", "Câncer de estômago"),
("Qual é um sintoma comum do câncer de intestino?", 2, "Dor de cabeça", "Sangue nas fezes", "Tosse persistente", "Perda de visão"),
("O gene BRCA está relacionado a qual tipo de câncer?", 2, "Câncer de pulmão", "Câncer de mama e ovário", "Câncer de pele", "Câncer de próstata"),
("Qual é a principal função da radioterapia?", 2, "Estimular o sistema imunológico", "Eliminar células cancerígenas com radiação", "Reduzir inflamações", "Aumentar a produção de glóbulos vermelhos"),
("O que é carcinoma?", 3, "Um tipo de vírus", "Um tipo de célula saudável", "Um tipo de câncer que começa em células epiteliais", "Uma técnica cirúrgica"),
("Qual marcador tumoral é usado para câncer de ovário?", 1, "CA 125", "PSA", "CEA", "AFP"),
("Qual tipo de câncer é mais comum em crianças?", 1, "Leucemia", "Câncer de mama", "Câncer de próstata", "Câncer de pele");

  ''');
  }
}
