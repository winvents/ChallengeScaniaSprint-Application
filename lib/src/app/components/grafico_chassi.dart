import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        color: Color.fromARGB(255, 61, 61, 65),
        child: Column(
          children: [
            const Text(
              'Chassis',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIndicator(
                  color: Colors.greenAccent,
                  text: 'Cavalo',
                  valorTotal: calculoPorcentagemChassi('Cavalo'),
                ),
                _buildIndicator(
                  color: Colors.redAccent,
                  text: 'Mecânico',
                  valorTotal: calculoPorcentagemChassi('Mecanico'),
                ),
                _buildIndicator(
                  color: Colors.blueAccent,
                  text: 'Rigido',
                  valorTotal: calculoPorcentagemChassi('Rigido'),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Expanded(
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
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
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
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> displayedSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.greenAccent,
            value: calculoPorcentagemChassi('Cavalo'),
            title: '${calculoPorcentagemChassi('Cavalo').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.redAccent,
            value: calculoPorcentagemChassi('Mecanico'),
            title:
                '${calculoPorcentagemChassi('Mecanico').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.blueAccent,
            value: calculoPorcentagemChassi('Rigido'),
            title: '${calculoPorcentagemChassi('Rigido').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
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

Widget _buildIndicator(
    {double size = 20,
    required Color color,
    required String text,
    required double valorTotal}) {
  return Row(
    children: <Widget>[
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            NumberFormat.decimalPattern().format(valorTotal),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      )
    ],
  );
}
