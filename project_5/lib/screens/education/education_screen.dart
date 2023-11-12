import 'package:flutter/material.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("add education "),
          ),

          // textfields to edit education or
          ElevatedButton(
            onPressed: () {},
            child: const Text("delete education "),
          ),
        ],
      ),
    );
  }
}
