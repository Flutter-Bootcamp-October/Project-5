import 'package:chatgpt_bloc/blocs/bloc_splash/splash_bloc.dart';
import 'package:chatgpt_bloc/blocs/bloc_splash/splash_state.dart';
import 'package:chatgpt_bloc/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashScreenBloc, SplashScreenState>(
      builder: (context, state) {
        if (state is SplashScreenStateLoading) {
          return _buildLoadingState(context);
        } else if (state is SplashScreenStateCompleted) {
          return const HomeScreen();
        } else if (state is NavigatorErrorState) {
          return _buildErrorState(context);
        } else {
          return _buildInitialState(context);
        }
      },
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(159, 255, 255, 255),
              Color.fromARGB(144, 68, 137, 255),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Robot.png'),
            Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.black,
                size: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(159, 255, 255, 255),
                Color.fromARGB(144, 68, 137, 255),
              ],
            ),
          ),
          child: const Center(
            child: Text('Error while moving'),
          )),
    );
  }

  Widget _buildInitialState(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromARGB(159, 255, 255, 255),
            Color.fromARGB(144, 68, 137, 255),
          ],
        ),
      ),
      child: const Center(
        child: Text('Error loading SplashScreen'),
      ),
    ));
  }
}
