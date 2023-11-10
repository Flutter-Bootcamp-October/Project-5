import 'package:flutter/material.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(child: Text("Logo Page")),
    ));
  }
}
