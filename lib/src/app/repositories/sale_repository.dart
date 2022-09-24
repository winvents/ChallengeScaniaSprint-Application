import 'package:challengescania_sprint2/src/database/database_manager.dart';

import '../model/sale.dart';

class SaleRepository {
  Future<void> gerarVenda(Sale sale) async {
    final db = await DatabaseManager().getDatabase();

    db.insert("venda", {
      "id_venda": sale.id_venda,
      "valor": sale.valor,
      "id_cliente": sale.id_cliente,
      "id_caminhao": sale.id_caminhao
    });
  }

  Future<List<Sale>> listarVendas() async {
    final db = await DatabaseManager().getDatabase();

    final List<Map<String, dynamic>> rows = await db.rawQuery('''
      SELECT
      venda.id_venda,
      venda.valor,
      venda.id_cliente,
      venda.id_caminhao,
      cliente.nome,
      cliente.documento,
      cliente.email,
      cliente.telefone,
      caminhao.serie,
      caminhao.operacao,
      caminhao.aplicacao,
      caminhao.eixo, 
      caminhao.chassi,
      caminhao.pesoMax,
      caminhao.mediaKm
      FROM venda
    INNER JOIN cliente ON cliente.id = venda.id_cliente
    INNER JOIN caminhao ON caminhao.id = venda.id_caminhao
''');

    return rows
        .map(
          (row) => Sale(
            id_venda: row['id_venda'],
            valor: row['valor'],
            id_cliente: row['id_cliente'],
            id_caminhao: row['id_caminhao'],
            nome: row['nome'],
            documento: row['documento'],
            email: row['email'],
            telefone: row['telefone'],
            serie: row['serie'],
            operacao: row['operacao'],
            aplicacao: row['aplicacao'],
            eixo: row['eixo'],
            chassi: row['chassi'],
            pesoMax: row['pesoMax'],
            mediaKm: row['mediaKm'],
          ),
        )
        .toList();
  }
}
