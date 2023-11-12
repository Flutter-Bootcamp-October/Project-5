import 'package:cv/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.lable,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.isPassword,
  });

  final bool isPassword;
  final TextEditingController controller;
  final String lable;
  final String hint;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        obscureText: isPassword ? true : false,
        controller: controller,
        decoration: InputDecoration(
          labelText: lable,
          labelStyle: const TextStyle(color: Color(0xff8a8c8d)),
          hintText: hint,
          hintStyle: const TextStyle(color: Color.fromARGB(105, 138, 140, 141)),
          prefixIcon: Icon(
            icon,
            size: 20,
          ),
          prefixIconColor: Color(0xff8a8c8d),
          filled: true,
          fillColor: const Color(0xffECF0F1),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
