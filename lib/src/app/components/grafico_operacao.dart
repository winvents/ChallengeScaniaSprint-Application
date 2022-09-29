import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        color: Color.fromARGB(255, 61, 61, 65),
        child: Column(children: [
          const Text(
            'Operações',
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
                text: 'Urbana',
                valorTotal: calculoPorcentagemOperacao('Urbana'),
              ),
              _buildIndicator(
                color: Colors.redAccent,
                text: 'Regional',
                valorTotal: calculoPorcentagemOperacao('Regional'),
              ),
              _buildIndicator(
                color: Colors.blueAccent,
                text: 'Longa Dist.',
                valorTotal: calculoPorcentagemOperacao('LongaDistancia'),
              ),
              _buildIndicator(
                color: Colors.purpleAccent,
                text: 'OffRoad',
                valorTotal: calculoPorcentagemOperacao('OffRoad'),
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
          const SizedBox(
            height: 35,
          ),
        ]),
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
            value: calculoPorcentagemOperacao('Urbana'),
            title:
                '${calculoPorcentagemOperacao('Urbana').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.redAccent,
            value: calculoPorcentagemOperacao('Regional'),
            title:
                '${calculoPorcentagemOperacao('Regional').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.blueAccent,
            value: calculoPorcentagemOperacao('LongaDistancia'),
            title:
                '${calculoPorcentagemOperacao('LongaDistancia').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.purpleAccent,
            value: calculoPorcentagemOperacao('OffRoad'),
            title:
                '${calculoPorcentagemOperacao('OffRoad').toStringAsFixed(1)}%',
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
