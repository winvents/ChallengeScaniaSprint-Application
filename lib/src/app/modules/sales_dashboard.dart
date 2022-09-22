import 'package:flutter/cupertino.dart';

class SalesDashboardPage extends StatefulWidget {
  const SalesDashboardPage({Key? key}) : super(key: key);

  @override
  State<SalesDashboardPage> createState() => _SalesDashboardPage();
}

class _SalesDashboardPage extends State<SalesDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('DashBoard'),
    );
  }
}