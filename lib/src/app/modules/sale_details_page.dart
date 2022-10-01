import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/standard_appbar.dart';
import '../model/sale.dart';

class SaleDetailsPage extends StatefulWidget {
  SaleDetailsPage({Key? key}) : super(key: key);

  @override
  State<SaleDetailsPage> createState() => _SaleDetailsPage();
}

class _SaleDetailsPage extends State<SaleDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final venda = ModalRoute.of(context)!.settings.arguments as Sale;

    return Scaffold(
      appBar: StandardAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 30,
        ),
        child: SingleChildScrollView(
          child: Container(
            width: 700,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 47, 11, 209).withOpacity(0.2),
                  const Color.fromARGB(255, 47, 11, 209).withOpacity(0.8)
                ],
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'DADOS DO CLIENTE',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Nome: ${venda.nome}',
                    style: const TextStyle(
                        height: 2,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    'Documento: ${venda.documento}',
                    style: const TextStyle(
                        fontSize: 18,
                        height: 2,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    'Email: ${venda.email}',
                    style: const TextStyle(
                        height: 2,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    'Telefone: ${venda.telefone}',
                    style: const TextStyle(
                        height: 2,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    'REQUISITOS DO PRODUTO',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Operação: ${venda.operacao.name}',
                        style: const TextStyle(
                            height: 2,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        'Aplicação: ${venda.aplicacao.name}',
                        style: const TextStyle(
                            height: 2,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        'Série da Cabine: ${venda.serie.name}',
                        style: const TextStyle(
                            height: 2,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        'Eixo: ${venda.eixo.name}',
                        style: const TextStyle(
                            height: 2,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        'Chassi: ${venda.chassi.name}',
                        style: const TextStyle(
                            height: 2,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        'Peso Máximo da Carga: ${venda.pesoMax}',
                        style: const TextStyle(
                            height: 2,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        'Média de Km anuais: ${venda.mediaKm}',
                        style: const TextStyle(
                            height: 2,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'VALOR DA VENDA ${NumberFormat.simpleCurrency(locale: 'pt_BR').format(venda.valor)}',
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
