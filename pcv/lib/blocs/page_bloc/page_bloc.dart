// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:pcv/main.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial()) {
    loading();
    on<ChangePageEvent>((event, emit) {
      emit(ChangePageState(index: event.index));
    });
  }
  loading() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (prefs!.getString('token') != null) {
          emit(SuccessTokenState());
        } else if (prefs!.getString('token') == null) {
          emit(WrongTokenState());
        }
      },
    );
  }
}
