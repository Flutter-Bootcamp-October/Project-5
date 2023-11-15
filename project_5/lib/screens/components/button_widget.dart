import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
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
            backgroundColor: MaterialStatePropertyAll(
              Color(0xCE0D48A1),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)))),
        child: Text(
          textEntry,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
