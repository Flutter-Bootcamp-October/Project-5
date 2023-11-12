import 'package:flutter/material.dart';

class MyCVScreen extends StatelessWidget {
  const MyCVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("About Me"),
          Text("Projects"),
          Text("Skills"),
          Text("Socials"),
          Text("Education"),
        ],
      ),
    );
  }
}
