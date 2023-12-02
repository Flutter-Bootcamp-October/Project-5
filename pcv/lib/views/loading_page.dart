import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/page_bloc/page_bloc.dart';
import 'package:pcv/main.dart';
import 'package:pcv/views/auth/sign_in_screen.dart';
import 'package:pcv/views/navi_bar.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    loading(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Image.asset("assets/logo.png"),
        ),
      ),
    );
  }

  loading(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (prefs!.getString('token') != null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => NaviBar()),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
            (route) => false,
          );
        }
      },
    );
  }
}
