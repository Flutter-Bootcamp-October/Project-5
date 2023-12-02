import 'package:cv_app/globals/colors.dart';
import 'package:flutter/material.dart';

class FillCV extends StatelessWidget {
  const FillCV({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              color: midColor, borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                size: 45,
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.arrow_forward_rounded, color: Colors.white)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
