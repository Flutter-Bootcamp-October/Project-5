import 'package:cv_application_api/constant/constant.dart';
import 'package:flutter/material.dart';

class UpdateInfoCustomTextField extends StatelessWidget {
  const UpdateInfoCustomTextField(
      {super.key,
      required this.textController,
      required this.hintText,
      required this.obscureText,
      this.suffix,
      required this.keyboardType});

  final TextEditingController textController;
  final String hintText;
  final bool obscureText;
  final Icon? suffix;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      style: const TextStyle(
          color: appWhite, fontWeight: FontWeight.w300, letterSpacing: 2),
      keyboardType: keyboardType,
      maxLines: 1,
      cursorColor: app2DarkGreen,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffix: suffix,
          hintStyle: const TextStyle(
              color: appWhiteTrans,
              fontWeight: FontWeight.w600,
              letterSpacing: 2),
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
