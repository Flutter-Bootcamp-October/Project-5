import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
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
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(206, 13, 72, 161)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)))),
        child: Text(textEntry),
      ),
    );
  }
}
