import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cv/services/auth/login.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninEvent>((event, emit) async {
      try {
        if (event.email.isNotEmpty && event.password.isNotEmpty) {
          final response =
              await login({"email": event.email, "password": event.password});
          if (response.statusCode >= 200 && response.statusCode < 300) {
       
            emit(SignInState());
          } else {
            emit(ErrorState(jsonDecode(response.body)["msg"]));
          }
        } else {
          emit(ErrorState("Please enter all information"));
        }
      } catch (error) {
        emit(ErrorState(error.toString()));
      }
    });
  }
}
