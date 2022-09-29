import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      aspectRatio: 1,
      child: Card(
        color: Color.fromARGB(255, 61, 61, 65),
        child: Column(
          children: [
            const Text(
              'Aplicações',
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
                  text: 'Basculante',
                  valorTotal: calculoPorcentagemAplicacao('Basculante'),
                ),
                _buildIndicator(
                  color: Colors.redAccent,
                  text: 'Cana',
                  valorTotal: calculoPorcentagemAplicacao('Cana'),
                ),
                _buildIndicator(
                  color: Colors.blueAccent,
                  text: 'Betoneira',
                  valorTotal: calculoPorcentagemAplicacao('Betoneira'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIndicator(
                  color: Colors.purpleAccent,
                  text: 'Bombeiro',
                  valorTotal: calculoPorcentagemAplicacao('BombeiroAutobomba'),
                ),
                _buildIndicator(
                  color: Colors.pinkAccent,
                  text: 'Carga Geral',
                  valorTotal: calculoPorcentagemAplicacao('CargaGeral'),
                ),
                _buildIndicator(
                  color: Colors.amberAccent,
                  text: 'Guindaste',
                  valorTotal:
                      calculoPorcentagemAplicacao('GuindasteCLancaFixa'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIndicator(
                  color: Colors.lightGreenAccent,
                  text: 'Madeireiro',
                  valorTotal: calculoPorcentagemAplicacao('Madeireiro'),
                ),
                _buildIndicator(
                  color: Colors.indigoAccent,
                  text: 'Roll On/Off',
                  valorTotal: calculoPorcentagemAplicacao('RollOnOff'),
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
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> displayedSections() {
    return List.generate(8, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.greenAccent,
            value: calculoPorcentagemAplicacao('Basculante'),
            title:
                '${calculoPorcentagemAplicacao('Basculante').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.redAccent,
            value: calculoPorcentagemAplicacao('Cana'),
            title: '${calculoPorcentagemAplicacao('Cana').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.blueAccent,
            value: calculoPorcentagemAplicacao('Betoneira'),
            title:
                '${calculoPorcentagemAplicacao('Betoneira').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.purpleAccent,
            value: calculoPorcentagemAplicacao('BombeiroAutobomba'),
            title:
                '${calculoPorcentagemAplicacao('Basculante').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            color: Colors.pinkAccent,
            value: calculoPorcentagemAplicacao('CargaGeral'),
            title:
                '${calculoPorcentagemAplicacao('CargaGeral').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 5:
          return PieChartSectionData(
            color: Colors.amberAccent,
            value: calculoPorcentagemAplicacao('GuindasteCLancaFixa'),
            title:
                '${calculoPorcentagemAplicacao('GuindasteCLancaFixa').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 6:
          return PieChartSectionData(
            color: Colors.lightGreenAccent,
            value: calculoPorcentagemAplicacao('Madeireiro'),
            title:
                '${calculoPorcentagemAplicacao('Madeireiro').toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 7:
          return PieChartSectionData(
            color: Colors.indigoAccent,
            value: calculoPorcentagemAplicacao('RollOnOff'),
            title:
                '${calculoPorcentagemAplicacao('RollOnOff').toStringAsFixed(1)}%',
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
