import 'package:flutter/material.dart';
import 'package:project_resume/screens/auth/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: const Text('Start')),
          ),
          const Spacer(),
          // Image.asset('assets/images/imageSplashScreen.png'),
        ],
      ),
    );
  }
}
