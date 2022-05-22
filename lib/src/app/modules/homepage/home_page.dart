import 'package:challengescania_sprint2/src/app/components/standard_page.dart';
import 'package:challengescania_sprint2/src/utils/exports.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StandardPage(
        title: title,
        body: Column(
          children: [
            SizedBox(
              height: 75,
            ),
            const Text(
              '${welcome} ${'User'}',
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: 75,
            ),
            const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer dignissim ut lacus sit amet facilisis. Etiam venenatis fringilla velit, eget molestie tortor sodales a. Vivamus tempor eget mi quis dictum.'),
            SizedBox(
              height: 75,
            ),
          ],
        ),
      ),
    );
  }
}
