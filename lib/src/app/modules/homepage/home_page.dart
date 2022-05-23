import 'package:challengescania_sprint2/src/app/components/standard_button.dart';
import 'package:challengescania_sprint2/src/app/components/standard_card.dart';
import 'package:challengescania_sprint2/src/app/components/standard_page.dart';
import 'package:challengescania_sprint2/src/utils/exports.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StandardPage(
      title: title,
      body: Column(
        children: [
          StandardCard(
            id: '#168950',
            status: 'ativo',
            linha: 'XT',
            aplicacao: 'Off-Road',
            motor: ' DC13 139/410 hp Euro 5/Proconve P7',
            valor: '958.110,26',
          ),
          SizedBox(
            height: 15,
          ),
          StandardCard(
            id: '#168950',
            status: 'ativo',
            linha: 'XT',
            aplicacao: 'Off-Road',
            motor: ' DC13 139/410 hp Euro 5/Proconve P7',
            valor: '958.110,26',
          ),
          SizedBox(
            height: 15,
          ),
          StandardCard(
            id: '#168950',
            status: 'ativo',
            linha: 'XT',
            aplicacao: 'Off-Road',
            motor: ' DC13 139/410 hp Euro 5/Proconve P7',
            valor: '958.110,26',
          ),
        ],
      ),
    );
    ;
  }
}
