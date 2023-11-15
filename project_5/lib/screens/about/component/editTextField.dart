import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.change,
    required this.hint,
  });
  final TextEditingController controller;
  final String title;
  final String hint;
  final Function(String) change;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 5),
      child: TextField(
        onChanged: change,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            label: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )),
      ),
    );
  }
}
