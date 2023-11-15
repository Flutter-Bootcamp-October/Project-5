import 'package:flutter/material.dart';
import 'package:project_resume/home_screen.dart';
import 'package:project_resume/screens/auth/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // ignore: curly_braces_in_flow_control_structures
    if (prefs.containsKey('token')) {
      // ignore: curly_braces_in_flow_control_structures
      if (prefs.getString('token')!.isNotEmpty) {
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
