import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  Future<Database> getDatabase() async {
    final path = join(await getDatabasesPath(), 'vendas.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    // await db.execute(_caminhao);
    // await db.execute(_cliente);
    await db.execute(_venda);
  }

  String get _venda => '''
    CREATE TABLE IF NOT EXISTS venda (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      valor REAL,
      nome TEXT,
      documento TEXT,
      email TEXT,
      telefone TEXT,   
      serie INTEGER,
      operacao INTEGER,
      aplicacao INTEGER,
      eixo INTEGER,
      chassi INTEGER,
      pesoMax DOUBLE,
      mediaKm DOUBLE
    );
  ''';
}
