import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

//get about data

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        //image
        ElevatedButton(
          onPressed: () {},
          child: const Text("upload image "),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("edit about "),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("delete about "),
        ),
      ],
    ));
  }
}
