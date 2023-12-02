import 'package:cv_app/globals/colors.dart';
import 'package:flutter/material.dart';

class ConnectWith extends StatelessWidget {
  const ConnectWith({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        height: 115,
        width: double.infinity,
        decoration: BoxDecoration(
            color: midColor, borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset(
                image,
                scale: 8,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
