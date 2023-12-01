import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/education_bloc/education_bloc.dart';
import 'package:pcv/blocs/project_bloc/project_bloc.dart';
import 'package:pcv/blocs/skill_bloc/skill_bloc.dart';
import 'package:pcv/blocs/social_bloc/social_bloc.dart';
import 'package:pcv/views/loading_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'blocs/auth_bloc/auth_bloc.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SkillBloc(),
        ),
        BlocProvider(
          create: (context) => EducationBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => ProjectBloc(),
        ),
        BlocProvider(
          create: (context) => SocialBloc(),
        ),
        // BlocProvider(
        //   create: (context) => DeleteBloc(),
        // ),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const LoadingPage(),
      ),
    );
  }
}
