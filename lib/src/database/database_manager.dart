import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  Future<Database> getDatabase() async {
    final path = join(await getDatabasesPath(), 'vendas.db');
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
      id_cliente INTEGER,
      id_caminhao INTEGER,
      FOREIGN KEY(id_cliente) REFERENCES cliente(id),
      FOREIGN KEY(id_caminhao) REFERENCES caminhao(id)
    );
  ''';

  String get _cliente => '''
    CREATE TABLE IF NOT EXISTS cliente (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      documento TEXT,
      email TEXT,
      telefone INTEGER   
    );
  ''';

  String get _caminhao => '''
    CREATE TABLE IF NOT EXISTS caminhao (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      serie TEXT,
      operacao TEXT,
      aplicacao TEXT,
      eixo TEXT,
      chassi TEXT,
      pesoMax DOUBLE,
      mediaKm DOUBLE
    );
  ''';
}
