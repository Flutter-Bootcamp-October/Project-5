import 'package:cv/blocs/signin_bloc/signin_bloc.dart';
import 'package:cv/blocs/signup_bloc/signup_bloc.dart';
import 'package:cv/blocs/verification_bloc/verification_bloc.dart';
import 'package:cv/screens/auth_screens/loding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupBloc(),
        ),
        BlocProvider(
          create: (context) => VerificationBloc(),
        ),
        BlocProvider(
          create: (context) => SigninBloc(),
        ),
      ],
      child: const MaterialApp(
        home: LodingScreen(),
      ),
    );
  }
}
