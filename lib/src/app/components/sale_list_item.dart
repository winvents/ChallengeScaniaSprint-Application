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
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 47, 11, 209).withOpacity(0.1),
                  const Color.fromARGB(255, 47, 11, 209).withOpacity(0.8),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: StandardSaleCard(
              valor: sale.valor,
              nome: sale.nome,
              documento: sale.documento,
              operacao: sale.operacao,
              aplicacao: sale.aplicacao,
            ),
          ),
        ),
      ),
    );
  }
}
