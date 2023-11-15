import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.lable,
      required this.hint,
      required this.icon,
      required this.isPassword,
      required this.controller});
  final String lable;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
          fillColor: const Color(0xfff9b5ca),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon:  Icon(icon),
          label: Text(lable),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          )),
    );
  }
}
