import 'package:challengescania_sprint2/src/app/model/types/tipo_cabine.dart';
import 'package:challengescania_sprint2/src/app/model/types/tipo_chassi.dart';
import 'package:challengescania_sprint2/src/app/model/types/tipo_eixo.dart';
import 'package:challengescania_sprint2/src/database/database_manager.dart';

import '../model/sale.dart';
import '../model/types/tipo_aplicacao.dart';
import '../model/types/tipo_operacao.dart';

class SaleRepository {
  Future<void> gerarVenda(Sale sale) async {
    final db = await DatabaseManager().getDatabase();

    db.insert("venda", {
      "id": sale.id,
      "valor": sale.valor,
      "nome": sale.nome,
      "documento": sale.documento,
      "email": sale.email,
      "telefone": sale.telefone,
      "serie": sale.serie.index,
      "operacao": sale.operacao.index,
      "aplicacao": sale.aplicacao.index,
      "eixo": sale.eixo.index,
      "chassi": sale.chassi.index,
      "pesoMax": sale.pesoMax,
      "mediaKm": sale.mediaKm
    });
  }

  Future<List<Sale>> listarVendas() async {
    final db = await DatabaseManager().getDatabase();

    final List<Map<String, dynamic>> rows = await db.rawQuery('''
      SELECT
      venda.id,
      venda.valor,
      venda.nome,
      venda.documento,
      venda.email,
      venda.telefone,
      venda.serie,
      venda.operacao,
      venda.aplicacao,
      venda.eixo, 
      venda.chassi,
      venda.pesoMax,
      venda.mediaKm
      FROM venda
''');
    return rows
        .map(
          (row) => Sale(
            id: row['id'],
            valor: row['valor'],
            nome: row['nome'],
            documento: row['documento'],
            email: row['email'],
            telefone: row['telefone'],
            serie: Cabine.values[row['serie']],
            operacao: Operacao.values[row['operacao']],
            aplicacao: Aplicacao.values[row['aplicacao']],
            eixo: Eixo.values[row['eixo']],
            chassi: Chassi.values[row['chassi']],
            pesoMax: row['pesoMax'],
            mediaKm: row['mediaKm'],
          ),
        )
        .toList();
  }

  Future<List<Cabine>> listarTiposDeSerie() async {
    final db = await DatabaseManager().getDatabase();
    final List<Map<String, dynamic>> rows = await db.rawQuery('''
          SELECT venda.serie FROM venda ''');

    return rows.map((row) => Cabine.values[row['serie']]).toList();
  }

  Future<List<Operacao>> listarTiposDeOperacao() async {
    final db = await DatabaseManager().getDatabase();
    final List<Map<String, dynamic>> rows = await db.rawQuery('''
          SELECT venda.operacao FROM venda ''');

    return rows.map((row) => Operacao.values[row['operacao']]).toList();
  }

  Future<List<Aplicacao>> listarTiposDeAplicacao() async {
    final db = await DatabaseManager().getDatabase();
    final List<Map<String, dynamic>> rows = await db.rawQuery('''
          SELECT venda.aplicacao FROM venda ''');

    return rows.map((row) => Aplicacao.values[row['aplicacao']]).toList();
  }

  Future<List<Eixo>> listarTiposDeEixo() async {
    final db = await DatabaseManager().getDatabase();
    final List<Map<String, dynamic>> rows = await db.rawQuery('''
          SELECT venda.eixo FROM venda ''');

    return rows.map((row) => Eixo.values[row['eixo']]).toList();
  }

  Future<List<Chassi>> listarTiposDeChassi() async {
    final db = await DatabaseManager().getDatabase();
    final List<Map<String, dynamic>> rows = await db.rawQuery('''
          SELECT venda.chassi FROM venda ''');

    return rows.map((row) => Chassi.values[row['chassi']]).toList();
  }

  Future<int> editarVenda(Sale sale) async {
    final db = await DatabaseManager().getDatabase();

    return db.update(
        "venda",
        {
          "id": sale.id,
          "valor": sale.valor,
          "nome": sale.nome,
          "documento": sale.documento,
          "email": sale.email,
          "telefone": sale.telefone,
          "serie": sale.serie.index,
          "operacao": sale.operacao.index,
          "aplicacao": sale.aplicacao.index,
          "eixo": sale.eixo.index,
          "chassi": sale.chassi.index,
          "pesoMax": sale.pesoMax,
          "mediaKm": sale.mediaKm
        },
        where: 'id = ?',
        whereArgs: [sale.id]);
  }

  Future<void> removerVenda(int id) async {
    final db = await DatabaseManager().getDatabase();
    await db.delete("venda", where: 'id = ?', whereArgs: [id]);
  }
}
