import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.iconData,
    required this.onPressedFunc,
  });

  final String title;
  final IconData iconData;
  final Function() onPressedFunc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          IconButton(onPressed: onPressedFunc, icon: Icon(iconData))
        ],
      ),
    );
  }
}
