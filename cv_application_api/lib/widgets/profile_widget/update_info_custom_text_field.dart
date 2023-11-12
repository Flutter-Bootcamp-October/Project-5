import 'package:cv_application_api/constant/constant.dart';
import 'package:flutter/material.dart';

class UpdateInfoCustomTextField extends StatelessWidget {
  const UpdateInfoCustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.suffix,
      required this.keyboardType});

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon? suffix;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
          color: appWhite, fontWeight: FontWeight.bold, letterSpacing: 2),
      keyboardType: keyboardType,
      controller: controller,
      maxLines: 1,
      cursorColor: app2DarkGreen,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffix: suffix,
          hintStyle: const TextStyle(
              color: appWhite, fontWeight: FontWeight.bold, letterSpacing: 2),
          hintText: hintText,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: app3DarkGreen),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: app3DarkGreen),
          )),
    );
  }
}
