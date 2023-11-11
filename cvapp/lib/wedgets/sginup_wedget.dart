import 'package:flutter/material.dart';

class SinUpWedget extends StatelessWidget {
  const SinUpWedget({
    super.key,
    required this.Controller,
    required this.labelText,
  });

  final TextEditingController Controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 40,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black, blurRadius: 1, offset: Offset(0, 1))
      ], borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: TextField(
        controller: Controller,
        decoration:
            InputDecoration(border: InputBorder.none, labelText: '$labelText '),
      ),
    );
  }
}
