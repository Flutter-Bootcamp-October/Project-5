import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:flutter/material.dart';

class EducationRow extends StatelessWidget {
  const EducationRow({
    super.key,
    required this.title,
    required this.info,
  });
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        width8,
        Text(
          title,
          style: const TextStyle(
              color: payneGrey, fontSize: 16, fontWeight: FontWeight.w800),
        ),
        const Spacer(),
        Text(info,
            style: const TextStyle(
                color: prussianBlue, fontSize: 16, fontWeight: FontWeight.w600))
      ],
    );
  }
}
