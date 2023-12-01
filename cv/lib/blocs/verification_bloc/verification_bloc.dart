import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cv/services/auth/verification.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  VerificationBloc() : super(VerificationInitial()) {
    on<VerificationEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      try {
        if (event.otp.isNotEmpty) {
          final response = await verification(
              {"otp": event.otp, "email": event.email, "type": event.type});

          if (response.statusCode >= 200 && response.statusCode < 300) {
            await prefs.setString(
                'token', jsonDecode(response.body)["data"]["token"]);
            emit(VerSuccsessState());
     
          } else {
            emit(ErrorState(jsonDecode(response.body)["msg"]));
          }
        } else {
          emit(ErrorState("Please enter the OTP"));
        }
      } catch (error) {
        emit(ErrorState(error.toString()));
      }
    });
  }
}
