import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../main.dart';
import '../../views/auth/register_screen.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpAuthEvent>((event, emit) async {
      List<bool> isValidation = [];
      isValidation.add(validation(keyForm: event.emailKey));
      isValidation.add(validation(keyForm: event.passwordKey));
      isValidation.add(validation(keyForm: event.phoneKey));
      isValidation.add(validation(keyForm: event.userNameKey));
      if (!isValidation.contains(false)) {
        try {
          final Response resp = await network.registerMethod({
            "name": event.userName,
            "phone": event.phone,
            "password": event.password,
            "email": event.email
          });
          if (resp.statusCode == 200) {
            emit(SignUpSuccessState());
          } else {
            emit(ErrorState("${await jsonDecode(resp.body)["msg"]}"));
          }
        } catch (e) {
          emit(ErrorState(e.toString()));
        }
      }
    });
    on<DisplayPasswordEvent>((event, emit) {
      if (event.display == true) {
        event.display = false;
        emit(DisplayState(display: event.display));
      } else {
        event.display = true;
        emit(DisplayState(display: event.display));
      }
    });
    on<LogInAuthEvent>((event, emit) async {
      List<bool> isValidation = [];
      isValidation.add(validation(keyForm: event.emailKey));
      isValidation.add(validation(keyForm: event.passwordKey));
      if (!isValidation.contains(false)) {
        try {
          final Response resp = await network.loginMethod({
            "password": event.password,
            "email": event.email,
          });
          if (resp.statusCode == 200) {
            emit(LoginSuccessState());
          } else {
            emit(ErrorState("email or password not correct"));
          }
        } catch (e) {
          emit(ErrorState(e.toString()));
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text(e.toString())));
        }
      }
    });
    on<VerificationEvent>((event, emit) async {
      try {
        final Response resp = await network.verificationMethod(
            {"otp": event.otp, "email": event.email, "type": event.type});
        if (resp.statusCode == 200) {
          if (event.type == "login" || event.type == "registration") {
            final String token = jsonDecode(resp.body)['data']['token'];
            await prefs?.setString('token', token);
            emit(LoginSuccessState());
          } else {
            emit(AuthInitial());
          }
        } else {
          emit(ErrorState("Wrong code"));
        }
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
  validation({required GlobalKey<FormState> keyForm}) {
    if (!keyForm.currentState!.validate()) {
      return false;
    }
    return true;
  }
}
