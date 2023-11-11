import 'package:flutter/material.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Text("Profile Screen"),
    ));
  }
}
