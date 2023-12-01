import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.text,
    this.obscure = false,
    required this.controller,
    this.keyForm,
    this.validator,
    this.displayPass = false,
    this.onTap,
  });
  final String text;
  final bool obscure;
  final TextEditingController? controller;
  final GlobalKey? keyForm;
  final String? Function(String?)? validator;

  final bool displayPass;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Form(
          key: keyForm,
          child: TextFormField(
            validator: validator,
            obscureText: !obscure ? false : !displayPass,
            controller: controller,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              suffixIcon: !obscure
                  ? null
                  : InkWell(
                      onTap: onTap,
                      child: Icon(!displayPass
                          ? Icons.visibility_off_sharp
                          : Icons.remove_red_eye),
                    ),
              label: Text(text),
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0.5),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0.5),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0.5),
                  borderRadius: BorderRadius.circular(10)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0.5),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ));
  }
}
