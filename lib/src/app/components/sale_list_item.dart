import 'package:challengescania_sprint2/src/app/components/standard_sale_card.dart';
import 'package:flutter/material.dart';

import '../model/sale.dart';

class StandardSaleItem extends StatelessWidget {
  final Sale sale;
  const StandardSaleItem({Key? key, required this.sale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 20,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/sale-details', arguments: sale);
          },
          child: StandardSaleCard(
            id_venda: sale.id_venda!,
            id_cliente: sale.id_cliente!,
            id_caminhao: sale.id_caminhao!,
            valor: sale.valor!,
          ),
        ),
      ),
    );
  }
}
