import 'package:flutter/material.dart';

class CategoryContainers extends StatelessWidget {
  const CategoryContainers({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.emoji,
  });
  final String title;
  final Color backgroundColor;
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 175,
      width: 165,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$title",
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            emoji,
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
