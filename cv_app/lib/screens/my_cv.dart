import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/services/about.dart';
import 'package:flutter/material.dart';

class MyCVScreen extends StatelessWidget {
  const MyCVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle =
        TextStyle(color: mainColor, fontSize: 20, fontWeight: FontWeight.bold);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () async {
                await showAbout();
              },
              child: Text("About Me", style: textStyle)),
          Text("Projects", style: textStyle),
          Text("Skills", style: textStyle),
          Text("Socials", style: textStyle),
          Text("Education", style: textStyle),
        ],
      ),
    );
  }
}
