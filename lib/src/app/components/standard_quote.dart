import 'package:challengescania_sprint2/src/app/components/standard_button.dart';
import 'package:challengescania_sprint2/src/app/modules/quote/single_quote.dart';
import 'package:flutter/material.dart';

class StandardQuote extends StatelessWidget {
  final String? id;
  final String? data;
  final String? nome;
  final String? documento;
  final String? email;
  final String? telefone;
  final String? operacao;
  final String? aplicacao;
  final String? eixo;
  final String? chassi;
  final String? serie;
  final String? pesoMax;
  final String? altura;
  final String? mediaKm;
  final String? valor;

  StandardQuote(
      {this.id,
      this.data,
      this.nome,
      this.documento,
      this.email,
      this.telefone,
      this.operacao,
      this.aplicacao,
      this.eixo,
      this.chassi,
      this.serie,
      this.pesoMax,
      this.altura,
      this.mediaKm,
      this.valor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 49, 49, 49),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 600,
      width: 350,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'COTAÇÃO $id',
              style: TextStyle(
                fontSize: 28,
                color: Color.fromARGB(255, 22, 173, 243),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Data:   $data',
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 104, 104, 104)),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 25,
                  width: 140,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color.fromARGB(15, 20, 20, 20),
                          Color.fromARGB(100, 20, 20, 20),
                        ]),
                  ),
                  child: Text(
                    '$nome',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: 140,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color.fromARGB(15, 20, 20, 20),
                          Color.fromARGB(100, 20, 20, 20),
                        ]),
                  ),
                  child: Text(
                    '$documento',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 25,
                  width: 140,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color.fromARGB(15, 20, 20, 20),
                          Color.fromARGB(100, 20, 20, 20),
                        ]),
                  ),
                  child: Text(
                    '$email',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: 140,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color.fromARGB(15, 20, 20, 20),
                          Color.fromARGB(100, 20, 20, 20),
                        ]),
                  ),
                  child: Text(
                    '$telefone',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color.fromARGB(15, 20, 20, 20),
                      Color.fromARGB(145, 20, 20, 20),
                    ]),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Operação:   $operacao',
                    style: TextStyle(
                      height: 1.75,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Aplicação:   $aplicacao',
                    style: TextStyle(
                      height: 1.75,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Configuração do eixo:   $eixo',
                    style: TextStyle(
                      height: 1.75,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Tipo de chassi:   $chassi',
                    style: TextStyle(
                      height: 1.75,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Série da Cabine:   $serie',
                    style: TextStyle(
                      height: 1.75,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Peso Máximo:   $pesoMax',
                    style: TextStyle(
                      height: 1.75,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Altura da Cabine:   $altura',
                    style: TextStyle(
                      height: 1.75,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Média de KM anual:   $mediaKm',
                    style: TextStyle(
                      height: 1.75,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              textAlign: TextAlign.center,
              'VALOR DA PROPOSTA \n R\$:   $valor',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 20, 16, 72),
                  ),
                  onPressed: () {},
                  child: Text('Gerar Venda'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
