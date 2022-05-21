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
        title: Text(title)
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
    );
  }
}
