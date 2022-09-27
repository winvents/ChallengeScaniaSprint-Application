import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../model/sale.dart';

class OperacaoChart extends StatefulWidget {
  final List<Sale> vendas;

  const OperacaoChart({Key? key, required this.vendas}) : super(key: key);

  @override
  State<OperacaoChart> createState() => _OperacaoChartState();
}

class _OperacaoChartState extends State<OperacaoChart> {
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

    var operacoes = widget.vendas.map((v) => v.operacao).toSet().toList();

    for (var i = 0; i < operacoes.length; i++) {
      final operacao = operacoes[i];
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      sections.add(
        PieChartSectionData(
          value: calculoPorcentagemOperacao(operacao.name),
          title:
              '${calculoPorcentagemOperacao(operacao.name).toStringAsFixed(1)}%',
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

  double calculoPorcentagemOperacao(String name) {
    var contTotal = 0;
    var contOperacao = 0;

    var totalOperacoes = widget.vendas.map((v) => v.operacao).toList();
    var totalPorOperacao = widget.vendas
        .where((v) => v.operacao.name == name)
        .map((v) => v.operacao.name);

    for (var o in totalOperacoes) {
      contTotal++;
    }

    for (var p in totalPorOperacao) {
      contOperacao++;
    }

    double porcentagemPorOperacao = (contOperacao / contTotal) * 100;
    return porcentagemPorOperacao;
  }
}
