import 'package:flutter/material.dart';
import 'package:resume_app/consts/colors.dart';

returnDec(
    {required Widget icon, required String hint, required String labelText}) {
  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: const TextStyle(color: appBlue),
    suffixIconColor: const Color(0xffdbd9d9),
    focusColor: appBlue,
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: appBlue),
        borderRadius: BorderRadius.circular(13)),
    label: Text(labelText),
    suffixIcon: icon ??
        const Icon(
          Icons.circle,
          color: Colors.white,
        ), //trying to make they eye an icon button that switch isPassword state
    hintStyle: const TextStyle(color: Color(0xffdbd9d9)),
    hintText: hint,
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
        borderSide: const BorderSide(color: appBlue),
        borderRadius: BorderRadius.circular(13)),
  );
}
