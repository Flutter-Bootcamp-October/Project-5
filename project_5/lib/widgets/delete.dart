import 'package:flutter/material.dart';

class CircularButtonDelete extends StatelessWidget {
  final VoidCallback? onPressed;

  CircularButtonDelete({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(12.0), // Adjust the padding for the button
      ),
      onPressed: onPressed,
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.delete_forever_outlined,
            size: 24.0, // Adjust the size of the icon
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
