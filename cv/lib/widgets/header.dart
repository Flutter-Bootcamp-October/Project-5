import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
