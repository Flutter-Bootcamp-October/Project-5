import 'package:flutter/material.dart';

class ContaHomeWidget extends StatelessWidget {
  const ContaHomeWidget({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
          height: 40,
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(15), right: Radius.circular(15))),
          child: Center(
              child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Icon(
                icon,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ))),
    );
  }
}
