import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:project_5/data/global_data.dart';
import 'package:project_5/screens/profile/profile_screen.dart';

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
    return AdaptiveTheme(
        light: ThemeData.light(useMaterial3: true),
        dark: ThemeData.dark(useMaterial3: true),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              debugShowCheckedModeBanner: false,
              darkTheme: ThemeData(
                useMaterial3: true,
                appBarTheme: AppBarTheme(
                    color:
                        isDarkTheme ? Colors.black : const Color(0xffe1dfef)),
              ),
              theme: pref.getTheme()
                  ? ThemeData.light(useMaterial3: true)
                  : ThemeData.dark(useMaterial3: true),
              home: pref.getToken().length > 1
                  ? const ProfileScreen()
                  : const SignInScreen(),
            ));
  }
}
