import 'package:challengescania_sprint2/src/app/model/client.dart';

import '../../database/database_manager.dart';

class ClientRepository {
  Future<void> cadastrarCliente(Cliente client) async {
    final db = await DatabaseManager().getDatabase();

    db.insert("cliente", {
      "id": client.id,
      "nome": client.nome,
      "documento": client.documento,
      "email": client.email,
      "telefone": client.telefone
    });
  }
}
