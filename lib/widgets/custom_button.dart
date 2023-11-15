import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressedFunc,
  });
  final String text;

  final Function() onPressedFunc;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            // elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            minimumSize: const Size(400, 60),
            backgroundColor: Color(0xffce84f7)),
        onPressed: onPressedFunc,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
          ),
        ));
  }
}
