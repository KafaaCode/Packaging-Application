import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomTextFeild({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color.fromRGBO(176, 179, 199, 1),
          fontSize: 14,
        ),
        border: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(176, 179, 199, 1), width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
