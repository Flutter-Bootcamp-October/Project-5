import 'package:cv/blocs/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:cv/blocs/education_bloc/education_bloc.dart';
import 'package:cv/blocs/project_bloc/project_bloc.dart';
import 'package:cv/blocs/radio_button_bloc/radio_button_bloc.dart';
import 'package:cv/blocs/signin_bloc/signin_bloc.dart';
import 'package:cv/blocs/signup_bloc/signup_bloc.dart';
import 'package:cv/blocs/skill_bloc/skill_bloc.dart';
import 'package:cv/blocs/social_bloc/social_bloc.dart';
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
        BlocProvider(
          create: (context) => EducationBloc(),
        ),
        BlocProvider(
          create: (context) => SkillBloc(),
        ),
        BlocProvider(
          create: (context) => EditProfileBloc(),
        ),
        BlocProvider(
          create: (context) => RadioButtonBloc(),
        ),
        BlocProvider(
          create: (context) => ProjectBloc(),
        ),
        BlocProvider(
          create: (context) => SocialBloc(),
        ),
      ],
      child: const MaterialApp(
        home: LodingScreen(),
      ),
    );
  }
}
