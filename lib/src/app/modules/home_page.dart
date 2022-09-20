import 'package:challengescania_sprint2/src/app/components/standard_page.dart';
import 'package:challengescania_sprint2/src/utils/exports.dart';
import 'package:flutter/material.dart';

//TO-DO Adicionar a renderização da lista de vendas geradas (método getAll)

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StandardPage(
      title: title,
      body: Column(
        children: const [
          Text(
            'LISTA DE VENDAS',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
