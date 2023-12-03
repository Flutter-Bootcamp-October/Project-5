import 'package:flutter/material.dart';

class DeleteButtonWidget extends StatelessWidget {
  const DeleteButtonWidget({
    super.key,
    required this.textEntry,
    required this.onpress,
  });
  final String textEntry;
  final Function() onpress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 245,
      height: 55,
      child: ElevatedButton(
        onPressed: onpress,
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
              Color.fromARGB(255, 174, 12, 0),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)))),
        child: Text(
          textEntry,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
