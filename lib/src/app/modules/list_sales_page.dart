import 'package:flutter/material.dart';
import '../components/sale_list_item.dart';
import '../model/sale.dart';
import '../repositories/sale_repository.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPage();
}

class _SalesPage extends State<SalesPage> {
  final _saleRepository = SaleRepository();
  late Future<List<Sale>> _futureSales;

  @override
  void initState() {
    carregarVendas();
    super.initState();
  }

  void carregarVendas() {
    _futureSales = _saleRepository.listarVendas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Sale>>(
        future: _futureSales,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final vendas = snapshot.data ?? [];
            return ListView.separated(
              itemCount: vendas.length,
              itemBuilder: ((context, index) {
                final venda = vendas[index];
                return StandardSaleItem(
                  sale: venda,
                );
              }),
              separatorBuilder: (context, index) => const Divider(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
