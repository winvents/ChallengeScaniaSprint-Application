import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../model/sale.dart';

class EixoChart extends StatefulWidget {
  final List<Sale> vendas;

  const EixoChart({Key? key, required this.vendas}) : super(key: key);

  @override
  State<EixoChart> createState() => _EixoChartState();
}

class _EixoChartState extends State<EixoChart> {
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

    var eixos = widget.vendas.map((v) => v.eixo).toSet().toList();

    for (var i = 0; i < eixos.length; i++) {
      final eixo = eixos[i];
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      sections.add(
        PieChartSectionData(
          value: calculoPorcentagemEixo(eixo.name),
          title: '${calculoPorcentagemEixo(eixo.name).toStringAsFixed(1)}%',
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

  double calculoPorcentagemEixo(String name) {
    var contTotal = 0;
    var contEixo = 0;

    var totalEixos = widget.vendas.map((v) => v.eixo).toList();
    var totalPorEixo =
        widget.vendas.where((v) => v.eixo.name == name).map((v) => v.eixo.name);

    for (var o in totalEixos) {
      contTotal++;
    }

    for (var p in totalPorEixo) {
      contEixo++;
    }

    double porcentagemPorEixo = (contEixo / contTotal) * 100;
    return porcentagemPorEixo;
  }
}
