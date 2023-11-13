import 'package:cv_app/globals/colors.dart';
import 'package:flutter/material.dart';

class MyCVScreen extends StatelessWidget {
  const MyCVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle =
        TextStyle(color: mainColor, fontSize: 20, fontWeight: FontWeight.bold);
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.color_lens, color: mainColor),
              Icon(Icons.design_services_outlined, color: mainColor),
              Icon(Icons.save_alt_rounded, color: mainColor)
            ],
          ),
          Divider(),
          Text("Projects", style: textStyle),
          Text("Skills", style: textStyle),
          Text("Socials", style: textStyle),
          Text("Education", style: textStyle),
        ],
      ),
    );
  }
}
