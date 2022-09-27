import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../model/sale.dart';

class SerieChart extends StatefulWidget {
  final List<Sale> vendas;

  const SerieChart({Key? key, required this.vendas}) : super(key: key);

  @override
  State<SerieChart> createState() => _SerieChartState();
}

class _SerieChartState extends State<SerieChart> {
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

    var series = widget.vendas.map((v) => v.serie).toSet().toList();

    for (var i = 0; i < series.length; i++) {
      final serie = series[i];
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      sections.add(
        PieChartSectionData(
          value: calculoPorcentagemSerie(serie.name),
          title: '${calculoPorcentagemSerie(serie.name).toStringAsFixed(1)}%',
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

  double calculoPorcentagemSerie(String name) {
    var contTotal = 0;
    var contSerie = 0;

    var totalSeries = widget.vendas.map((v) => v.serie).toList();
    var totalPorSerie = widget.vendas
        .where((v) => v.serie.name == name)
        .map((v) => v.serie.name);

    for (var o in totalSeries) {
      contTotal++;
    }

    for (var p in totalPorSerie) {
      contSerie++;
    }

    double porcentagemPorserie = (contSerie / contTotal) * 100;
    return porcentagemPorserie;
  }
}
