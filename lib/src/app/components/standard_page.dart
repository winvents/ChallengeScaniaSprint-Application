import 'package:flutter/material.dart';
import 'package:challengescania_sprint2/src/utils/exports.dart';

class StandardPage extends StatelessWidget {
  final Widget body;
  final String title;

  StandardPage({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black,
                  Color.fromARGB(255, 20, 20, 20),
                ]),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/scanialogo.png',
              fit: BoxFit.cover,
              height: 40,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              width: 40,
            ),
          ],
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(
            left: PaddingSizes.introPageBorder,
            right: PaddingSizes.introPageBorder,
            top: PaddingSizes.introPageTop,
          ),
          child: SingleChildScrollView(
            child: body,
          )),
      bottomNavigationBar: BottomNavigationBar(
        mouseCursor: SystemMouseCursors.grab,
        backgroundColor: Color.fromARGB(255, 53, 53, 53),
        iconSize: 30,
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: IconThemeData(
          color: Color.fromARGB(255, 126, 126, 126),
        ),
        unselectedItemColor: Color.fromARGB(255, 126, 126, 126),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Nova Cotação',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Consultar vendas',
          ),
        ],
      ),
    );
  }
}
