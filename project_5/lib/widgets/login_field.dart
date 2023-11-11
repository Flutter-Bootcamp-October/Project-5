import 'package:flutter/material.dart';
import 'package:project_5/pallete.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final TextEditingController? controller;

  const LoginField({
    Key? key,
    required this.hintText,
    required this.iconData,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: hintText.toLowerCase() == 'password',
        decoration: InputDecoration(
          prefixIcon: Icon(
            iconData,
          ),
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Palette.borderColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Palette.gradient2,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
