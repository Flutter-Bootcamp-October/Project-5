import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomRow extends StatelessWidget {
  BottomRow({super.key, required this.controller, required this.onPressed});

  final TextEditingController controller;
  Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.7,
            height: 48,
            child: TextField(
              controller: controller,
              textAlignVertical: const TextAlignVertical(y: 1),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(
                  Icons.question_mark_outlined,
                  color: Colors.grey,
                ),
                hintText: 'Ask Koala ...',
                hintStyle: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ),
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.white),
            onPressed: onPressed,
            child: const Text('SEND'),
          ),
        ],
      ),
    );
  }
}
