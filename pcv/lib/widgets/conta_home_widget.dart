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
          width: MediaQuery.of(context).size.width * 0.88,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.grey.shade100.withOpacity(0.5),
              borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(15), right: Radius.circular(15))),
          child: Center(
              child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ))),
    );
  }
}
