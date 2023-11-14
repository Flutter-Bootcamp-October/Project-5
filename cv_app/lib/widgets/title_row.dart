import 'package:cv_app/globals/colors.dart';
import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                color: mainColor, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(width: 88),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.add_box_rounded,
            color: mainColor,
          ),
        ),
      ],
    );
  }
}
