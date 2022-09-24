import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StandardSaleCard extends StatelessWidget {
  int id_venda;
  double valor;
  int id_cliente;
  int id_caminhao;

  StandardSaleCard({
    super.key,
    required this.id_venda,
    required this.id_cliente,
    required this.id_caminhao,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(id_venda.toString(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Valor: ${NumberFormat.simpleCurrency(locale: 'pt_BR').format(valor)}',
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Id caminhão: $id_caminhao',
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text('Id caminhão: $id_cliente'),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
