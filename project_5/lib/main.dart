import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/bloc/auth_bloc/auth_bloc.dart';
import 'package:project_5/bloc/education%20bloc/education_cubit.dart';
import 'package:project_5/bloc/skills_bloc/skills_cubit.dart';
import 'package:project_5/screens/profile/profile_screen.dart';
import 'package:project_5/theme/theme.dart';

import 'prefrences/shared_prefrences.dart';
import 'screens/auth/sign_in_screen.dart';

SharedPref pref = SharedPref();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await pref.initializePref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<EducationCubit>(
          create: (context) => EducationCubit(),
        ),
        BlocProvider<SkillsCubit>(
          create: (context) => SkillsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeMap[pref.getTheme() ? "dark" : "light"],
        home: pref.getToken().length > 1 ? const ProfileScreen() : SignInScreen(),
      ),
    );
  }
}
