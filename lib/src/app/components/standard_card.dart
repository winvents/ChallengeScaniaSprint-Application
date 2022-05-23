import 'package:challengescania_sprint2/src/app/components/standard_button.dart';
import 'package:flutter/material.dart';

class StandardCard extends StatelessWidget {
  final String? id;
  final String? status;
  final String? linha;
  final String? aplicacao;
  final String? motor;
  final String? valor;

  StandardCard(
      {this.id,
      this.status,
      this.linha,
      this.aplicacao,
      this.motor,
      this.valor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 49, 49, 49),
      ),
      height: 200,
      width: 350,
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'COTAÇÃO $id',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 22, 173, 243),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Status:   $status',
              // style:,
            ),
            Text(
              'Linha:   $linha',
              // style:,
            ),
            Text(
              'Aplicação:   $aplicacao',
              // style:,
            ),
            Text(
              'Motor:   $motor',
              // style:,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'R\$:   $valor',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.open_in_new,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
