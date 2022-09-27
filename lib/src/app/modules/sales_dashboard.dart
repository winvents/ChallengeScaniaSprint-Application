import 'package:challengescania_sprint2/src/app/components/grafico_aplicacao.dart';
import 'package:challengescania_sprint2/src/app/components/grafico_chassi.dart';
import 'package:challengescania_sprint2/src/app/components/grafico_eixo.dart';
import 'package:challengescania_sprint2/src/app/components/grafico_operacao.dart';
import 'package:challengescania_sprint2/src/app/components/grafico_serie.dart';
import 'package:challengescania_sprint2/src/app/model/types/tipo_eixo.dart';
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
                  OperacaoChart(vendas: vendas),
                  AplicacaoChart(vendas: vendas),
                  SerieChart(vendas: vendas),
                  EixoChart(vendas: vendas),
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
