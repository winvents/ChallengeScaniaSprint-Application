class Sale {
  final int? id;
  final double? valor;
  final int? id_cliente;
  final int? id_caminhao;
  final String? nome;
  final String? documento;
  final String? email;
  final String? telefone;
  final String? operacao;
  final String? aplicacao;
  final String? eixo;
  final String? chassi;
  final String? serie;
  final double? pesoMax;
  final double? mediaKm;

  Sale(
      {this.id,
      this.valor,
      this.id_cliente,
      this.id_caminhao,
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
      this.mediaKm});
}
