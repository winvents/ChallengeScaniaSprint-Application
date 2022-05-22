import 'package:challengescania_sprint2/src/utils/exports.dart';
import 'package:flutter/material.dart';

class StandardAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 13, 13, 13),
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
    );
  }
}
