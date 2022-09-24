import 'package:flutter/material.dart';

import '../model/sale.dart';

class SaleDetailsPage extends StatefulWidget {
  SaleDetailsPage({Key? key}) : super(key: key);

  @override
  State<SaleDetailsPage> createState() => _SaleDetailsPage();
}

class _SaleDetailsPage extends State<SaleDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final venda = ModalRoute.of(context)!.settings.arguments as Sale;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 40,
        ),
        child: SingleChildScrollView(
          child: Container(
            width: 650,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(venda.valor.toString()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
