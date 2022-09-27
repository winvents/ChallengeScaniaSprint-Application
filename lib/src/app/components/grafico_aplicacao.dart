import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../model/sale.dart';

class AplicacaoChart extends StatefulWidget {
  final List<Sale> vendas;

  const AplicacaoChart({Key? key, required this.vendas}) : super(key: key);

  @override
  State<AplicacaoChart> createState() => _AplicacaoChartState();
}

class _AplicacaoChartState extends State<AplicacaoChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Color.fromARGB(255, 20, 16, 72),
        child: AspectRatio(
          aspectRatio: 1,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              }),
              borderData: FlBorderData(show: false),
              sectionsSpace: 0,
              centerSpaceRadius: 60,
              sections: displayedSections(),
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> displayedSections() {
    List<PieChartSectionData> sections = [];

    var aplicacoes = widget.vendas.map((v) => v.aplicacao).toSet().toList();

    for (var i = 0; i < aplicacoes.length; i++) {
      final aplicacao = aplicacoes[i];
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      sections.add(
        PieChartSectionData(
          value: calculoPorcentagemAplicacao(aplicacao.name),
          title:
              '${calculoPorcentagemAplicacao(aplicacao.name).toStringAsFixed(1)}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        ),
      );
    }
    return sections;
  }

  double calculoPorcentagemAplicacao(String name) {
    var contTotal = 0;
    var contAplicacao = 0;

    var totalAplicacoes = widget.vendas.map((v) => v.aplicacao).toList();
    var totalPorAplicacao = widget.vendas
        .where((v) => v.aplicacao.name == name)
        .map((v) => v.aplicacao.name);

    for (var o in totalAplicacoes) {
      contTotal++;
    }

    for (var p in totalPorAplicacao) {
      contAplicacao++;
    }

    double porcentagemPorAplicacao = (contAplicacao / contTotal) * 100;
    return porcentagemPorAplicacao;
  }
}
