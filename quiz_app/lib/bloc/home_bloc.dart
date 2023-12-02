import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/home.state.dart';
import 'package:quiz_app/bloc/home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState("little red riding hood")) {
    on<HomeEvent>((event, emit) {
      emit(HomeState(event.title));
    });
  }
}
