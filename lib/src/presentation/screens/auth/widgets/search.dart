import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 14),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: 'Search...',
        filled: true,
        fillColor: const Color(0xFFF5F6FA),
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xFFBDC1C8),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 30,
          minHeight: 40,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF70b9be),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        isDense: true,
      ),
    );
  }
}
