import 'package:challengescania_sprint2/src/utils/exports.dart';
import 'package:flutter/material.dart';

class StandardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StandardAppBar({super.key});

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
          const SizedBox(
            width: 5,
          ),
          const Text(
            title,
            style: TextStyle(fontSize: 35),
          ),
          const SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
