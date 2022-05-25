import 'package:challengescania_sprint2/src/app/components/standard_card.dart';
import 'package:challengescania_sprint2/src/app/components/standard_page.dart';
import 'package:challengescania_sprint2/src/app/components/standard_quote.dart';
import 'package:challengescania_sprint2/src/utils/exports.dart';
import 'package:flutter/material.dart';

class SingleQuote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StandardPage(
      title: title,
      body: StandardQuote(
        id: '#168950',
        data: '05/05/2022',
        nome: 'João da Silva',
        documento: '123.456.789-00',
        email: 'joaos@email.com',
        telefone: '99876-5432',
        operacao: 'Urbana',
        aplicacao: 'Carga Geral',
        eixo: 'A6x2',
        chassi: 'Cavalo Mecânico',
        serie: 'P',
        pesoMax: '200 T',
        altura: 'Estendida Teto Normal',
        mediaKm: '8000',
        valor: '958.110,26',
      ),
    );
  }
}
