import 'package:challengescania_sprint2/src/app/components/grafico_aplicacao.dart';
import 'package:challengescania_sprint2/src/app/components/grafico_chassi.dart';
import 'package:challengescania_sprint2/src/app/components/grafico_eixo.dart';
import 'package:challengescania_sprint2/src/app/components/grafico_operacao.dart';
import 'package:challengescania_sprint2/src/app/components/grafico_serie.dart';
import 'package:challengescania_sprint2/src/app/repositories/sale_repository.dart';
import 'package:flutter/material.dart';

import '../model/sale.dart';

class SalesDashboardPage extends StatefulWidget {
  const SalesDashboardPage({Key? key}) : super(key: key);

  @override
  State<SalesDashboardPage> createState() => _SalesDashboardPage();
}

class _SalesDashboardPage extends State<SalesDashboardPage> {
  Future<List<Sale>>? futureSales;

  @override
  void initState() {
    super.initState();
    futureSales = SaleRepository().listarVendas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Sale>>(
        future: futureSales,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final vendas = snapshot.data ?? [];
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                      child: Text('Esta é a Dashboard.',
                          style: TextStyle(
                              fontSize: 22,
                              height: 1.5,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center)),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
                    child: Text(
                      '\nÉ aqui que você pode ver insights sobre as vendas geradas de acordo com cada tipo de módulo personalizável.',
                      style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  OperacaoChart(vendas: vendas),
                  SizedBox(
                    height: 10,
                  ),
                  AplicacaoChart(vendas: vendas),
                  SizedBox(
                    height: 10,
                  ),
                  SerieChart(vendas: vendas),
                  SizedBox(
                    height: 10,
                  ),
                  EixoChart(vendas: vendas),
                  SizedBox(
                    height: 10,
                  ),
                  ChassiChart(vendas: vendas)
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
