import 'package:flutter/material.dart';

class Costomimage extends StatelessWidget {
  const Costomimage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 200),
      child: Container(
        alignment: Alignment.centerLeft,
        width: 170,
        height: 170,
        child: Image.asset(
          "lib\\assets\\imges\\img1.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
