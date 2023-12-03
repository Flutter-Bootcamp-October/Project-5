import 'package:flutter/material.dart';

class BackgroundWhiteContainer extends StatelessWidget {
  const BackgroundWhiteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(53, 255, 255, 255),
    );
  }
}
