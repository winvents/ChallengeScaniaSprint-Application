import 'package:challengescania_sprint2/src/app/modules/new_sale_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
            return ListView.builder(
              itemCount: vendas.length,
              itemBuilder: (context, index) {
                final venda = vendas[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) async {
                          await _saleRepository.removerVenda(venda.id!);

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Venda removida com sucesso')));
                          setState(() {
                            vendas.removeAt(index);
                          });
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Remover',
                      ),
                      SlidableAction(
                        onPressed: (context) async {
                          var success = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => NewSale(
                                vendaEditavel: venda,
                              ),
                            ),
                          ) as bool?;

                          if (success != null && success) {
                            setState(() {
                              carregarVendas();
                            });
                          }
                        },
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Editar',
                      ),
                    ],
                  ),
                  child: StandardSaleItem(sale: venda),
                );
              },
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 20, 16, 72),
          onPressed: () async {
            bool? vendaCadastrada =
                await Navigator.of(context).pushNamed('/new-sale') as bool?;

            if (vendaCadastrada != null && vendaCadastrada) {
              setState(() {
                carregarVendas();
              });
            }
          },
          child: const Icon(Icons.add)),
    );
  }
}
