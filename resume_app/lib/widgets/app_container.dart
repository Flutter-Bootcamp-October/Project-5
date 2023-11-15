import 'package:flutter/material.dart';
import 'package:resume_app/consts/colors.dart';

class BlueContainer extends StatelessWidget {
  const BlueContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(45 / 360),
      child: Container(
        height: 480,
        width: 400,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: appBlue,
        ),
      ),
    );
  }
}
