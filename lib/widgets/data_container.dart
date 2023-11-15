import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  DataContainer({
    super.key,
    required this.heigh,
    required this.width,
    required this.color,
  });
  dynamic heigh;
  dynamic width;

  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigh,
      width: width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    );
  }
}
