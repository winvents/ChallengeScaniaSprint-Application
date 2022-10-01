import 'package:challengescania_sprint2/src/app/model/types/tipo_aplicacao.dart';
import 'package:challengescania_sprint2/src/app/model/types/tipo_cabine.dart';
import 'package:challengescania_sprint2/src/app/model/types/tipo_chassi.dart';
import 'package:challengescania_sprint2/src/app/model/types/tipo_eixo.dart';
import 'package:challengescania_sprint2/src/app/model/types/tipo_operacao.dart';

class Sale {
  int? id;
  double valor;
  String nome;
  String documento;
  String email;
  String telefone;
  Cabine serie;
  Operacao operacao;
  Aplicacao aplicacao;
  Eixo eixo;
  Chassi chassi;
  double pesoMax;
  double mediaKm;

  Sale(
      {this.id,
      required this.valor,
      required this.nome,
      required this.documento,
      required this.email,
      required this.telefone,
      required this.serie,
      required this.operacao,
      required this.aplicacao,
      required this.eixo,
      required this.chassi,
      required this.pesoMax,
      required this.mediaKm});
}
