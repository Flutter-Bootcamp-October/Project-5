import 'package:cv_app/constentes/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: richBlack,
      body: Center(
        child: ImageIcon(
          AssetImage(
            'lib/assets/images/pngkey.com-resume-png-1225289.png',
          ),
          color: white,
          size: 200,
        ),
      ),
    );
  }
}
