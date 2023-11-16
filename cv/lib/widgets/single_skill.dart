import 'package:flutter/material.dart';

class SingleSkill extends StatelessWidget {
  const SingleSkill({super.key, required this.skillName});
  final String skillName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Text(
            skillName,
            style: TextStyle(fontSize: 16),
          ),
        ),
        /*const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Delete",
            style: TextStyle(
              color: Color(0xffFF7779),
            ),
          ),
        ),*/
      ],
    );
  }
}
