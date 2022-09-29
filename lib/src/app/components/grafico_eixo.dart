import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        color: Color.fromARGB(255, 61, 61, 65),
        child: Column(
          children: [
            const Text(
              'Eixos',
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
                  text: 'B6X4',
                  valorTotal: calculoPorcentagemEixo('B6X4'),
                ),
                _buildIndicator(
                  color: Colors.redAccent,
                  text: 'B8X4',
                  valorTotal: calculoPorcentagemEixo('B8X4'),
                ),
                _buildIndicator(
                  color: Colors.blueAccent,
                  text: 'A4X2',
                  valorTotal: calculoPorcentagemEixo('A4X2'),
                ),
                _buildIndicator(
                  color: Colors.purpleAccent,
                  text: 'A6X2',
                  valorTotal: calculoPorcentagemEixo('A6X2'),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
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
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.greenAccent,
            value: calculoPorcentagemEixo('B6X4'),
            title: '${calculoPorcentagemEixo('B6X4').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.redAccent,
            value: calculoPorcentagemEixo('B8X4'),
            title: '${calculoPorcentagemEixo('B8X4').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.blueAccent,
            value: calculoPorcentagemEixo('A4X2'),
            title: '${calculoPorcentagemEixo('A4X2').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.purpleAccent,
            value: calculoPorcentagemEixo('A6X2'),
            title: '${calculoPorcentagemEixo('A6X2').toStringAsFixed(1)}%',
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
