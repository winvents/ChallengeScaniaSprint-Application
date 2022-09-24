import 'package:flutter/material.dart';

class StandardTextField extends StatelessWidget {
  final String label;
  final Function()? onEditingComplete;
  final TextEditingController? userInputController;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  StandardTextField(
      {required this.label,
      required this.userInputController,
      this.onEditingComplete,
      this.focusNode,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: userInputController,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(),
      ),
      style: TextStyle(color: Colors.white),
      validator: validator,
    );
  }
}
