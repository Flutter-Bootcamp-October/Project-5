
import 'package:cv_app/constentes/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.name,
  });
  final Function() onTap;
  final String name;
  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: payneGrey,
          ),
          child: Center(
              child: Text(
            widget.name,
            style: TextStyle(
                color: eggShell, fontSize: 18, fontWeight: FontWeight.w800),
          ))),
    );
  }
}