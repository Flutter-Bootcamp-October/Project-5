import 'package:flutter/material.dart';

class AppBotton extends StatelessWidget {
  const AppBotton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xff6d9674),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        )),
      ),
    );
  }
}
