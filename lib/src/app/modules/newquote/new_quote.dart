import 'package:challengescania_sprint2/src/app/components/standard_page.dart';
import 'package:challengescania_sprint2/src/app/components/standard_textfield.dart';
import 'package:challengescania_sprint2/src/app/modules/homepage/home_page.dart';
import 'package:challengescania_sprint2/src/app/modules/quote/single_quote.dart';
import 'package:challengescania_sprint2/src/utils/exports.dart';
import 'package:flutter/material.dart';

class NewQuote extends StatelessWidget {
  var aplicacao = [
    'Basculante',
    'Cana',
    'Betoneira',
    'Bombeiro/Autobomba',
    'Carga Geral',
    'Guindaste c/ lança fixa',
    'Madeireiro',
    'Roll on/Roll of',
  ];

  var eixo = [
    'B6-X4',
    'B8-X4',
    'A4-X2',
    'A6-X2',
  ];

  var chassi = ['Cavalo', 'Mecânico ', 'Rígido',];

  var cabine = ['Série P', 'Série G', 'Série R',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StandardPage(
        title: title,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'GERAR COTAÇÃO',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'DADOS DO CLIENTE',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 49, 49, 49),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              width: 350,
              height: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage('assets/images/caminhao.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 25,
                        width: 160,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color.fromARGB(100, 20, 20, 20),
                                Color.fromARGB(200, 20, 20, 20),
                              ]),
                        ),
                        child: StandardTextField(label: 'Nome do Cliente'),
                      ),
                      Container(
                        height: 25,
                        width: 160,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color.fromARGB(100, 20, 20, 20),
                                Color.fromARGB(200, 20, 20, 20),
                              ]),
                        ),
                        child: StandardTextField(label: 'CPF / CNPJ'),
                      ),
                      Container(
                        height: 25,
                        width: 160,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color.fromARGB(100, 20, 20, 20),
                                Color.fromARGB(200, 20, 20, 20),
                              ]),
                        ),
                        child: StandardTextField(label: 'E-mail'),
                      ),
                      Container(
                        height: 25,
                        width: 160,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color.fromARGB(100, 20, 20, 20),
                                Color.fromARGB(200, 20, 20, 20),
                              ]),
                        ),
                        child: StandardTextField(label: 'Telefone'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'REQUISITOS DO PRODUTO',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'OPERAÇÃO',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 49, 49, 49),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  width: 80,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_city,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text('Urbana'),
                      // Radio(
                      //   value: 'Urbana',
                      //   groupValue: 'operation',
                      //   onChanged: null,
                      // ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 49, 49, 49),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  width: 80,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.route,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text('Regional'),
                      // Radio(
                      //   value: 'Regional',
                      //   groupValue: 'operation',
                      //   onChanged: null,
                      // ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 49, 49, 49),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  width: 80,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.public,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text('Longa \nDistância'),
                      // Radio(
                      //   value: 'LongaDistância',
                      //   groupValue: 'operation',
                      //   onChanged: null,
                      // ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 49, 49, 49),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  width: 80,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.alt_route,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text('Off Road'),
                      // Radio(
                      //   value: 'OffRoad',
                      //   groupValue: 'operation',
                      //   onChanged: null,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Aplicação'),
                    DropdownButton(
                      dropdownColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      value: aplicacao[0],
                      items: aplicacao.map((String aplicacao) {
                        return DropdownMenuItem(
                          value: aplicacao,
                          child: Text(aplicacao),
                        );
                      }).toList(),
                      onChanged: null,
                    )
                  ],
                ),
                 SizedBox(width: 25,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Configuração do Eixo'),
                    DropdownButton(
                      value: eixo[0],
                      items: eixo.map((String eixo) {
                        return DropdownMenuItem(
                          value: eixo,
                          child: Text(eixo),
                        );
                      }).toList(),
                      onChanged: null,
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tipo de Chassi'),
                    DropdownButton(
                      value: chassi[0],
                      items: chassi.map((String chassi) {
                        return DropdownMenuItem(
                          value: chassi,
                          child: Text(chassi),
                        );
                      }).toList(),
                      onChanged: null,
                    )
                  ],
                ),
                SizedBox(width:100,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Série da Cabine'),
                    DropdownButton(
                      value: cabine[0],
                      items: cabine.map((String cabine) {
                        return DropdownMenuItem(
                          value: cabine,
                          child: Text(cabine),
                        );
                      }).toList(),
                      onChanged: null,
                    )
                  ],
                ),
                
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Peso Máximo da Carga'),
                Slider(
                  inactiveColor: Color.fromARGB(255, 20, 16, 72),
                  activeColor: Color.fromARGB(255, 36, 25, 196),
                  value: 3.5,
                  onChanged: null,
                  max: 200,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'ALTURA DA CABINE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 49, 49, 49),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  width: 100,
                  height: 50,
                  child: Text('Leito com \nTeto Normal'),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 49, 49, 49),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  width: 100,
                  height: 50,
                  child: Text('Leito com \nTeto Alto'),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Média de KM Anual'),
                Slider(
                  inactiveColor: Color.fromARGB(255, 20, 16, 72),
                  activeColor: Color.fromARGB(255, 36, 25, 196),
                  value: 1,
                  onChanged: null,
                  max: 200,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 20, 16, 72),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => HomePage()),
                      ),
                    );
                  },
                  child: Text('Salvar Cotação'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 20, 16, 72),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => SingleQuote()),
                      ),
                    );
                  },
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
