import 'package:flutter/material.dart';

class CircularButtonUpdate extends StatelessWidget {
  final VoidCallback? onPressed;

  CircularButtonUpdate({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Change the color for update button
        shape: const CircleBorder(),
        padding: EdgeInsets.all(12.0), // Adjust the padding for the button
      ),
      onPressed: onPressed,
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.update_outlined, // Use the update icon
            size: 24.0, // Adjust the size of the icon
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
