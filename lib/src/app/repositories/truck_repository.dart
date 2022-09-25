import 'package:challengescania_sprint2/src/app/model/truck.dart';
import 'package:challengescania_sprint2/src/database/database_manager.dart';

class TruckRepository {
  Future<void> cadastrarCaminhao(Truck truck) async {
    final db = await DatabaseManager().getDatabase();

    db.insert("caminhao", {
      "id": truck.id,
      "serie": truck.serie,
      "operacao": truck.operacao,
      "aplicacao": truck.aplicacao,
      "eixo": truck.eixo,
      "chassi": truck.chassi,
      "pesoMax": truck.pesoMax,
      "mediaKm": truck.mediaKm
    });
  }
}
