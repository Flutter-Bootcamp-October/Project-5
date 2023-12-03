import 'package:finance_app/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: '🐨',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          TextSpan(
            text: ' Koala Adviser',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FavoriteScreen();
          }));
        },
        icon: const Icon(
          Icons.favorite,
          color: Colors.red,
          size: 28,
        ),
      ),
    ],
  );
}
