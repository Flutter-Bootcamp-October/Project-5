import 'package:cv_application_api/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.suffix,
      required this.keyboardType});

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon suffix;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
          color: app1DarkGreen, fontWeight: FontWeight.bold, letterSpacing: 2),
      keyboardType: keyboardType,
      controller: controller,
      maxLines: 1,
      cursorColor: app2DarkGreen,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffix: suffix,
          hintStyle: const TextStyle(
              color: app1DarkGreen,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none)),
    ).asGlass(
        tintColor: Color.fromARGB(255, 9, 24, 9),
        clipBorderRadius: BorderRadius.circular(20));
  }
}
