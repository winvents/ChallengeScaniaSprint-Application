import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../model/sale.dart';

class ChassiChart extends StatefulWidget {
  final List<Sale> vendas;

  const ChassiChart({Key? key, required this.vendas}) : super(key: key);

  @override
  State<ChassiChart> createState() => _ChassiChartState();
}

class _ChassiChartState extends State<ChassiChart> {
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

    var chassis = widget.vendas.map((v) => v.chassi).toSet().toList();

    for (var i = 0; i < chassis.length; i++) {
      final chassi = chassis[i];
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      sections.add(
        PieChartSectionData(
          value: calculoPorcentagemChassi(chassi.name),
          title: '${calculoPorcentagemChassi(chassi.name).toStringAsFixed(1)}%',
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

  double calculoPorcentagemChassi(String name) {
    var contTotal = 0;
    var contChassi = 0;

    var totalChassis = widget.vendas.map((v) => v.chassi).toList();
    var totalPorChassi = widget.vendas
        .where((v) => v.chassi.name == name)
        .map((v) => v.chassi.name);

    for (var o in totalChassis) {
      contTotal++;
    }

    for (var p in totalPorChassi) {
      contChassi++;
    }

    double porcentagemPorChassi = (contChassi / contTotal) * 100;
    return porcentagemPorChassi;
  }
}
