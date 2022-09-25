import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StandardSaleCard extends StatelessWidget {
  int idVenda;
  double valor;
  int idCliente;
  int idCaminhao;

  StandardSaleCard({
    super.key,
    required this.idVenda,
    required this.idCliente,
    required this.idCaminhao,
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
          Text(idVenda.toString(),
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
                'Id caminhão: $idCaminhao',
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text('Id caminhão: $idCliente'),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
