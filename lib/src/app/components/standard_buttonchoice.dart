import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final Icon icon;

  StandardButton(
      {required this.buttonText, required this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(buttonText),
            ],
          ),
        ),
      ),
    );
  }
}
