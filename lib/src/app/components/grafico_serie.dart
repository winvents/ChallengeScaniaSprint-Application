import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        color: Color.fromARGB(255, 61, 61, 65),
        child: Column(
          children: [
            const Text(
              'Série da Cabine',
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
                  text: 'P',
                  valorTotal: calculoPorcentagemSerie('P'),
                ),
                _buildIndicator(
                  color: Colors.redAccent,
                  text: 'G',
                  valorTotal: calculoPorcentagemSerie('G'),
                ),
                _buildIndicator(
                  color: Colors.blueAccent,
                  text: 'R',
                  valorTotal: calculoPorcentagemSerie('R'),
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
            value: calculoPorcentagemSerie('P'),
            title: '${calculoPorcentagemSerie('P').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.redAccent,
            value: calculoPorcentagemSerie('G'),
            title: '${calculoPorcentagemSerie('G').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.blueAccent,
            value: calculoPorcentagemSerie('R'),
            title: '${calculoPorcentagemSerie('R').toStringAsFixed(1)}%',
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
