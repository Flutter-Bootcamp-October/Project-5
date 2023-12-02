import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/page_bloc/page_bloc.dart';
import 'package:pcv/views/auth/sign_in_screen.dart';
import 'package:pcv/views/navi_bar.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<PageBloc, PageState>(
          listener: (context, state) {
            if (state is SuccessTokenState) {
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
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
