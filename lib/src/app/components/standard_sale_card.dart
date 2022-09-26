import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/types/tipo_aplicacao.dart';
import '../model/types/tipo_operacao.dart';

class StandardSaleCard extends StatelessWidget {
  final double valor;
  final String nome;
  final String documento;
  final Operacao operacao;
  final Aplicacao aplicacao;

  StandardSaleCard({
    super.key,
    required this.valor,
    required this.nome,
    required this.documento,
    required this.operacao,
    required this.aplicacao,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Image(image: AssetImage('assets/images/caminhao.png')),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cliente: $nome',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Valor: ${NumberFormat.simpleCurrency(locale: 'pt_BR').format(valor)}',
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Operação: ${operacao.name}'),
              const SizedBox(
                height: 10,
              ),
              Text('Aplicação: ${aplicacao.name}'),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
