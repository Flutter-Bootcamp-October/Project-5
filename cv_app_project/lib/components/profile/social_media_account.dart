import 'package:flutter/material.dart';

class SocialAccount extends StatelessWidget {
  SocialAccount({super.key, required this.username});
  String username;
  // String src;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
