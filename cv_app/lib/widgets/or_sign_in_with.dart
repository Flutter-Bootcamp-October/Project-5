import 'package:flutter/material.dart';

class OrSignInWith extends StatelessWidget {
  const OrSignInWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(height: 2, width: 120, color: Colors.grey),
              const Text("Or Sign in with"),
              Container(height: 2, width: 120, color: Colors.grey)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 112, vertical: 8),
            child: Image.asset("assets\\social_media.jpg"),
          )
        ],
      ),
    );
  }
}
