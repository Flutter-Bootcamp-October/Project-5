import 'package:cv_app/constentes/colors.dart';
import 'package:flutter/material.dart';

class AuthTextFelid extends StatelessWidget {
  const AuthTextFelid({
    super.key,
    required this.text,
    required this.icon,
    required this.isHaveIcon,
  });

  final String text;
  final IconData? icon;
  final bool isHaveIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(
              color: payneGrey,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(
              prefixIcon: isHaveIcon
                  ? Icon(
                      icon,
                      color: prussianBlue,
                    )
                  : null,
              filled: true,
              fillColor: eggShell,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: text,
              hintStyle:
                  TextStyle(color: prussianBlue, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
