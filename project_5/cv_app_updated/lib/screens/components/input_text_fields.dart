import 'package:flutter/material.dart';

class InputTextFields extends StatelessWidget {
  const InputTextFields({
    super.key,
    required this.controller,
    required this.title,
    required this.lines,
  });
  final TextEditingController controller;
  final String title;
  final int lines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintMaxLines: lines,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            label: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )),
      ),
    );
  }
}
