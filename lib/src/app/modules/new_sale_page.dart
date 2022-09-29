import 'package:challengescania_sprint2/src/app/components/standard_button.dart';
import 'package:challengescania_sprint2/src/app/model/types/tipo_aplicacao.dart';
import 'package:challengescania_sprint2/src/app/model/types/tipo_cabine.dart';
import 'package:challengescania_sprint2/src/app/model/types/tipo_chassi.dart';
import 'package:challengescania_sprint2/src/app/model/types/tipo_eixo.dart';
import 'package:challengescania_sprint2/src/app/model/types/tipo_operacao.dart';
import 'package:challengescania_sprint2/src/app/repositories/sale_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';

import '../components/standard_appbar.dart';
import '../components/standard_textfield.dart';
import '../model/sale.dart';

class NewSale extends StatefulWidget {
  Sale? vendaEditavel;
  NewSale({Key? key, this.vendaEditavel}) : super(key: key);

  @override
  State<NewSale> createState() => _NewSaleState();
}

class _NewSaleState extends State<NewSale> {
  final _saleRepository = SaleRepository();

  final _clienteNameCrontoller = TextEditingController();
  final _clienteDocumentCrontoller = TextEditingController();
  final _clienteEmailCrontoller = TextEditingController();
  final _clienteNumberCrontoller = TextEditingController();
  final _pesoMaxController = TextEditingController();
  final _mediaKmController = TextEditingController();
  final _valorController = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.', leftSymbol: 'R\$');

  Operacao _operacaoSelecionada = Operacao.Urbana;
  List<Operacao> _operacoes = [];

  Aplicacao _aplicacaoSelecionada = Aplicacao.CargaGeral;
  List<Aplicacao> _aplicacoes = [];

  Eixo _eixoSelecionado = Eixo.A4X2;
  List<Eixo> _eixos = [];

  Chassi _chassiSelecionado = Chassi.Cavalo;
  List<Chassi> _chassis = [];

  Cabine _cabineSelecionada = Cabine.G;
  List<Cabine> _cabines = [];

  @override
  void initState() {
    super.initState();

    final venda = widget.vendaEditavel;
    if (venda != null) {
      _clienteNameCrontoller.text = venda.nome;
      _clienteDocumentCrontoller.text = venda.documento;
      _clienteEmailCrontoller.text = venda.email;
      _clienteNumberCrontoller.text = venda.telefone;
      _pesoMaxController.text =
          NumberFormat.decimalPattern().format(venda.pesoMax);
      _mediaKmController.text =
          NumberFormat.decimalPattern().format(venda.mediaKm);
      _valorController.text =
          NumberFormat.simpleCurrency(locale: 'pt_BR').format(venda.valor);
    }

    carregarTipoSerie();
    carregarTipoOperacao();
    carregarTipoAplicacao();
    carregarTipoChassi();
    carregarTipoEixo();
  }

  Future<void> carregarTipoSerie() async {
    final tiposDeSerie = await _saleRepository.listarTiposDeSerie();

    setState(() {
      _cabines =
          tiposDeSerie.where((tipos) => tipos == _cabineSelecionada).toList();
    });
  }

  Future<void> carregarTipoOperacao() async {
    final tiposDeOperacao = await _saleRepository.listarTiposDeOperacao();

    setState(() {
      _operacoes = tiposDeOperacao
          .where((tipos) => tipos == _operacaoSelecionada)
          .toList();
    });
  }

  Future<void> carregarTipoAplicacao() async {
    final tiposDeAplicacao = await _saleRepository.listarTiposDeAplicacao();

    setState(() {
      _aplicacoes = tiposDeAplicacao
          .where((tipos) => tipos == _aplicacaoSelecionada)
          .toList();
    });
  }

  Future<void> carregarTipoChassi() async {
    final tiposDeChassi = await _saleRepository.listarTiposDeChassi();

    setState(() {
      _chassis =
          tiposDeChassi.where((tipos) => tipos == _chassiSelecionado).toList();
    });
  }

  Future<void> carregarTipoEixo() async {
    final tiposDeEixo = await _saleRepository.listarTiposDeEixo();

    setState(() {
      _eixos = tiposDeEixo.where((tipos) => tipos == _eixoSelecionado).toList();
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: StandardAppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'NOVA VENDA',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildClientCard(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildTipoOperacao(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildTipoAplicacao(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildTipoEixo(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildTipoChassi(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildTipoSerie(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildPesoMaxField(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildMediaKmField(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildValor(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildSaveButton()
                ],
              ),
            ),
          ),
        ));
  }

  Container _buildClientCard() {
    return Container(
      decoration: BoxDecoration(
        // color: Color.fromARGB(255, 44, 44, 44),
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 36, 36, 36).withOpacity(0.2),
            const Color.fromARGB(255, 36, 36, 36).withOpacity(0.8),
          ],
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      width: 350,
      height: 180,
      child: Column(
        children: [
          const Text(
            'DADOS DO CLIENTE',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StandardTextField(
                keyboardType: TextInputType.text,
                height: 30,
                label: 'Nome do Cliente',
                userInputController: _clienteNameCrontoller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe um Nome';
                  }
                  if (value.length < 3 || value.length > 12) {
                    return 'O nome deve ter entre 3 e 12 caracteres';
                  }
                  return null;
                },
              ),
              StandardTextField(
                keyboardType: TextInputType.text,
                height: 30,
                label: 'CPF / CNPJ',
                userInputController: _clienteDocumentCrontoller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe um número de documento';
                  }
                  return null;
                },
              ),
              StandardTextField(
                keyboardType: TextInputType.text,
                height: 30,
                label: 'E-mail',
                userInputController: _clienteEmailCrontoller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe um endereço de e-mail';
                  }
                  if (value.length < 11 || value.length > 30) {
                    return 'O email deve ter entre 11 e 30 caracteres';
                  }
                  return null;
                },
              ),
              StandardTextField(
                keyboardType: TextInputType.number,
                height: 30,
                label: 'Telefone',
                userInputController: _clienteNumberCrontoller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe um número de telefone';
                  }
                  if (value.length < 11 || value.length > 30) {
                    return 'O número deve ter entre 11 e 30 caracteres';
                  }
                  return null;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  DropdownButtonFormField _buildTipoOperacao() {
    return DropdownButtonFormField<Operacao>(
      value: _operacaoSelecionada,
      onChanged: (Operacao? op) {
        setState(() {
          _operacaoSelecionada = op!;
        });
      },
      items: Operacao.values.map((o) {
        String opName = '';
        switch (o.name) {
          case 'Urbana':
            opName = 'Urbana';
            break;
          case 'Regional':
            opName = 'Regional';
            break;
          case 'LongaDistancia':
            opName = 'Longa Distância';
            break;
          case 'OffRoad':
            opName = 'Off Road';
            break;
        }
        return DropdownMenuItem<Operacao>(value: o, child: Text(opName));
      }).toList(),
      decoration: const InputDecoration(
        hintText: 'Selecione um tipo de operação',
        labelText: 'Tipo de Operação',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null) {
          return 'Informe um tipo de meta';
        }
        return null;
      },
    );
  }

  DropdownButtonFormField _buildTipoAplicacao() {
    return DropdownButtonFormField<Aplicacao>(
      value: _aplicacaoSelecionada,
      onChanged: (Aplicacao? aplicacao) {
        setState(() {
          _aplicacaoSelecionada = aplicacao!;
        });
      },
      items: Aplicacao.values.map((a) {
        String apName = '';
        switch (a.name) {
          case 'Basculante':
            apName = 'Basculante';
            break;
          case 'Cana':
            apName = 'Cana';
            break;
          case 'Betoneira':
            apName = 'Betoneira';
            break;
          case 'BombeiroAutobomba':
            apName = 'Bombeiro / Autobomba';
            break;
          case 'CargaGeral':
            apName = 'Carga Geral';
            break;
          case 'GuindasteCLancaFixa':
            apName = 'Guindaste C/ Lança Fixa';
            break;
          case 'Madeireiro':
            apName = 'Madeireiro';
            break;
          case 'RollOnOff':
            apName = 'Roll On / Roll Off';
            break;
        }
        return DropdownMenuItem<Aplicacao>(value: a, child: Text(apName));
      }).toList(),
      decoration: const InputDecoration(
        hintText: 'Selecione um tipo de aplicação',
        labelText: 'Tipo de Aplicação',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null) {
          return 'Informe um tipo de aplicação';
        }
        return null;
      },
    );
  }

  DropdownButtonFormField _buildTipoEixo() {
    return DropdownButtonFormField<Eixo>(
      value: _eixoSelecionado,
      onChanged: (Eixo? eixo) {
        setState(() {
          _eixoSelecionado = eixo!;
        });
      },
      items: Eixo.values.map((e) {
        return DropdownMenuItem<Eixo>(value: e, child: Text(e.name));
      }).toList(),
      decoration: const InputDecoration(
        hintText: 'Selecione um tipo de eixo',
        labelText: 'Tipo de Eixo',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null) {
          return 'Informe um tipo de eixo';
        }
        return null;
      },
    );
  }

  DropdownButtonFormField _buildTipoChassi() {
    return DropdownButtonFormField<Chassi>(
      value: _chassiSelecionado,
      onChanged: (Chassi? chassi) {
        setState(() {
          _chassiSelecionado = chassi!;
        });
      },
      items: Chassi.values.map((c) {
        return DropdownMenuItem<Chassi>(value: c, child: Text(c.name));
      }).toList(),
      decoration: const InputDecoration(
        hintText: 'Selecione um tipo de chassi',
        labelText: 'Tipo de Chassi',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null) {
          return 'Informe um tipo de chassi';
        }
        return null;
      },
    );
  }

  DropdownButtonFormField _buildTipoSerie() {
    return DropdownButtonFormField<Cabine>(
      value: _cabineSelecionada,
      onChanged: (Cabine? cabine) {
        setState(() {
          _cabineSelecionada = cabine!;
        });
      },
      items: Cabine.values.map((c) {
        return DropdownMenuItem<Cabine>(value: c, child: Text(c.name));
      }).toList(),
      decoration: const InputDecoration(
        hintText: 'Selecione a série da Cabine',
        labelText: 'Série da Cabine',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null) {
          return 'Informe a série da cabine';
        }
        return null;
      },
    );
  }

  StandardTextField _buildPesoMaxField() {
    return StandardTextField(
      keyboardType: TextInputType.number,
      label: 'Peso Máximo',
      userInputController: _pesoMaxController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe um peso máximo de carga';
        }
        if (value.length < 0) {
          return 'O valor deve ser maior que zero';
        }
        return null;
      },
    );
  }

  StandardTextField _buildMediaKmField() {
    return StandardTextField(
      keyboardType: TextInputType.number,
      label: 'Média de KM Anual',
      userInputController: _mediaKmController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe uma média de KM anuais';
        }
        if (value.length < 0) {
          return 'O valor deve ser maior que zero';
        }
        return null;
      },
    );
  }

  StandardTextField _buildValor() {
    return StandardTextField(
      keyboardType: TextInputType.number,
      userInputController: _valorController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe um Valor';
        }
        final valor = NumberFormat.currency(locale: 'pt_BR')
            .parse(_valorController.text.replaceAll('R\$', ''));
        if (valor <= 0) {
          return 'Informe um valor maior que zero';
        }

        return null;
      },
      label: 'Valor da venda',
    );
  }

  StandardButton _buildSaveButton() {
    return StandardButton(
      buttonText: 'GERAR VENDA',
      onPressed: () async {
        final isValid = _formKey.currentState!.validate();
        if (isValid) {
          final clienteNome = _clienteNameCrontoller.text;
          final clienteDocumento = _clienteDocumentCrontoller.text;
          final clienteEmail = _clienteEmailCrontoller.text;
          final clienteTelefone = _clienteNumberCrontoller.text;

          var cabine = _cabineSelecionada;
          var operacao = _operacaoSelecionada;
          var aplicacao = _aplicacaoSelecionada;
          var eixo = _eixoSelecionado;
          var chassi = _chassiSelecionado;

          final pesoMax = NumberFormat.decimalPattern()
              .parse(_pesoMaxController.text)
              .toDouble();

          final mediaKm = NumberFormat.decimalPattern()
              .parse(_mediaKmController.text)
              .toDouble();

          final valor = NumberFormat.currency(locale: 'pt_BR')
              .parse(_valorController.text.replaceAll('R\$', ''))
              .toDouble();

          final venda = Sale(
              valor: valor,
              nome: clienteNome,
              documento: clienteDocumento,
              email: clienteEmail,
              telefone: clienteTelefone,
              serie: cabine,
              operacao: operacao,
              aplicacao: aplicacao,
              eixo: eixo,
              chassi: chassi,
              pesoMax: pesoMax,
              mediaKm: mediaKm);

          try {
            if (widget.vendaEditavel != null) {
              venda.id = widget.vendaEditavel!.id;
              await _saleRepository.editarVenda(venda);
            } else {
              await _saleRepository.gerarVenda(venda);
            }

            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Venda gerada com Sucesso!')));

            Navigator.of(context).pop(true);
          } catch (e) {
            Navigator.of(context).pop(false);
          }
        }
      },
    );
  }
}
