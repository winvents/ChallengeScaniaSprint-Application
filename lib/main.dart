import 'package:challengescania_sprint2/src/app/modules/home_page.dart';
import 'package:challengescania_sprint2/src/app/modules/intro_page.dart';
import 'package:challengescania_sprint2/src/app/modules/list_sales_page.dart';
import 'package:challengescania_sprint2/src/app/modules/new_sale_page.dart';
import 'package:challengescania_sprint2/src/app/modules/sale_details_page.dart';
import 'package:challengescania_sprint2/src/app/modules/sales_dashboard.dart';
import 'package:challengescania_sprint2/src/theme/theme_constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scania App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routes: {
        '/': (context) => const HomePage(),
        '/new-sale': (context) => NewSale(),
        '/sale-details': (context) => SaleDetailsPage(),
      },
      initialRoute: '/',
    );
  }
}
