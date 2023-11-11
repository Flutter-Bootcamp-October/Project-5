import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.label,
      this.isObscure = false,
      required this.icon,
      this.textInputType = TextInputType.text});
  final String label;
  final bool isObscure;
  final IconData icon;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffffb902), width: 1.75),
        borderRadius: BorderRadius.all(Radius.circular(20)));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: TextField(
        obscureText: isObscure,
        keyboardType: textInputType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          prefixIconColor: const Color(0xffffb902).withOpacity(0.9),
          hintText: label,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
        ),
      ),
    );
  }
}
