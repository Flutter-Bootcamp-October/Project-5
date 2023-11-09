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
    return TextField(
      obscureText: obscure,
      controller: controller,
      onTap: () => print(controller!.text),
      decoration: InputDecoration(
          label: Text(text),
          labelStyle: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.5),
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20), right: Radius.circular(20))),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20), right: Radius.circular(20)))),
    );
  }
}
