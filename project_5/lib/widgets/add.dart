import 'package:flutter/material.dart';

class CircularButtonAdd extends StatelessWidget {
  final VoidCallback? onPressed;

  CircularButtonAdd({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Change the color for the add button
        shape: const CircleBorder(),
        padding:
            const EdgeInsets.all(12.0), // Adjust the padding for the button
      ),
      onPressed: onPressed,
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.add,
            size: 24.0, // Adjust the size of the icon
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
