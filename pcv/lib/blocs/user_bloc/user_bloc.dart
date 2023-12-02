
// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:pcv/model/user_model.dart';
import 'package:pcv/services/api_about.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    loadingAbout();
  }
  loadingAbout() async {
    final dataAbout = await netAbout.getUserMethod();
    emit(GetUserState(about: dataAbout!));
  }
}
