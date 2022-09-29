import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  Future<Database> getDatabase() async {
    final path = join(await getDatabasesPath(), 'vendas.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(_venda);
    await db.insert("venda", {
      "valor": '150000',
      "nome": 'Diego',
      "documento": '12345678910',
      "email": 'diego@email.com',
      "telefone": '11123456789',
      "serie": 0,
      "operacao": 0,
      "aplicacao": 0,
      "eixo": 0,
      "chassi": 0,
      "pesoMax": '500',
      "mediaKm": '15000'
    });
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
