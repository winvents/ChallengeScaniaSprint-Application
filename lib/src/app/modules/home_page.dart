import 'package:challengescania_sprint2/src/app/components/standard_appbar.dart';
import 'package:challengescania_sprint2/src/app/modules/list_sales_page.dart';
import 'package:challengescania_sprint2/src/app/modules/sales_dashboard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StandardAppBar(),
      body: PageView(
        controller: pc,
        onPageChanged: setPaginaAtual,
        children: [
          const SalesDashboardPage(),
          const SalesPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 53, 53, 53),
          iconSize: 30,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          selectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedIconTheme: const IconThemeData(
            color: Color.fromARGB(255, 126, 126, 126),
          ),
          unselectedItemColor: const Color.fromARGB(255, 126, 126, 126),
          currentIndex: paginaAtual,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'Vendas',
            ),
          ],
          onTap: (pagina) {
            pc.animateToPage(
              pagina,
              duration: const Duration(milliseconds: 400),
              curve: Curves.ease,
            );
          }),
    );
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }
}
