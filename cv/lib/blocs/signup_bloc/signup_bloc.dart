import 'dart:convert';

import 'package:cv/services/auth/cearte_account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignUpEvent>((event, emit) async {
      try {
        if (event.name.isNotEmpty &&
            event.email.isNotEmpty &&
            event.phone.isNotEmpty &&
            event.password.isNotEmpty) {
          final response = await cearteAccount({
            "name": event.name,
            "phone": event.phone,
            "email": event.email,
            "password": event.password
          });
          if (response.statusCode >= 200 && response.statusCode < 300) {
            emit(SignUpState());
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
