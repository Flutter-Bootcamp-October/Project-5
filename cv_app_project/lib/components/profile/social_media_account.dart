import 'package:flutter/material.dart';

class SocialAccount extends StatelessWidget {
  SocialAccount({super.key, required this.src, required this.username});
  String username;
  String src;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          src,
          height: 40,
          width: 40,
        ),
        Text(
          username,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
