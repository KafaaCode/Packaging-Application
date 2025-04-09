import 'package:flutter/material.dart';

class ButtonCostum extends StatelessWidget {
  final String text;
  final Size size;
  final Function() onPressed;
  const ButtonCostum(
      {super.key,
      required this.text,
      required this.onPressed,
      this.size = const Size(300, 50)});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          fixedSize: size),
      child: Text(
        text,
        style: theme.textTheme.bodySmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
    );
  }
}
