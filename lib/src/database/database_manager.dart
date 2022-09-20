import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  Future<Database> getDatabase() async {
    final path = join(await getDatabasesPath(), 'financas.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(_caminhao);
    await db.execute(_cliente);
    await db.execute(_venda);
  }

  String get _venda => '''
    CREATE TABLE IF NOT EXISTS venda (
      id_venda INTEGER PRIMARY KEY AUTOINCREMENT,
      valor DOUBLE,
      FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
      FOREIGN KEY(id_caminhao) REFERENCES caminhao(id_caminhao),
    );
  ''';

  String get _cliente => '''
    CREATE TABLE IF NOT EXISTS cliente (
      id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
      data INTEGER,
      nome TEXT,
      documento TEXT,
      email TEXT,
      telefone INTEGER   
    );
  ''';
  String get _caminhao => '''
    CREATE TABLE IF NOT EXISTS caminhao (
      id_caminhao INTEGER PRIMARY KEY AUTOINCREMENT
      serie TEXT,
      operacao TEXT,
      aplicacao TEXT,
      eixo TEXT,
      chassi TEXT,
      pesoMax DOUBLE,
      altura DOUBLE,
      mediaKm DOUBLE
    );
  ''';
}
