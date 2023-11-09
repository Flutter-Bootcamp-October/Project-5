import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.text,
    required this.obscure,
    required this.controller,
  });
  final String text;
  final bool obscure;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextField(
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
            label: Text(text),
            labelStyle: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 0.5),
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30), right: Radius.circular(30))),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30), right: Radius.circular(30)))),
      ),
    );
  }
}
