import 'package:chatgpt_bloc/blocs/bloc_splash/splash_event.dart';
import 'package:chatgpt_bloc/blocs/bloc_splash/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenStateInitial()) {
    on<SplashScreenEvent>(
      (event, emit) async {
        try {
          if (event is SplashScreenEventStart) {
            emit(SplashScreenStateLoading());

            await Future.delayed(const Duration(seconds: 5));

            emit(SplashScreenStateCompleted());
          }
        } catch (er) {
          return emit(NavigatorErrorState());
        }
      },
    );
  }
}
