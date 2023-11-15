import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWithLabel extends StatelessWidget {
  TextFieldWithLabel({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.isPass,
  });
  String label;
  String hint;
  TextEditingController controller;
  bool isPass;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xff0C356A),
          ),
        ),
        SizedBox(height: 8),
        TextField(
          obscureText: isPass,
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0C356A)),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff9d9a9d)),
                borderRadius: BorderRadius.circular(10)),
            hintText: hint,
            hintStyle: TextStyle(
              color: Color(0xff9d9a9d),
            ),
            label: Text('$label'),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
