import 'package:chatgpt_bloc/blocs/bloc_chat_with_gpt/chat_with_gpt_bloc.dart';
import 'package:chatgpt_bloc/blocs/bloc_generate_image/generate_image_bloc.dart';
import 'package:chatgpt_bloc/blocs/bloc_splash/splash_bloc.dart';
import 'package:chatgpt_bloc/blocs/bloc_splash/splash_event.dart';
import 'package:chatgpt_bloc/screens/splash_screen.dart';
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
          create: (BuildContext context) => ChatWithGPTBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => GenerateImageBloc(),
        ),
        BlocProvider(
            create: (context) =>
                SplashScreenBloc()..add(SplashScreenEventStart())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
