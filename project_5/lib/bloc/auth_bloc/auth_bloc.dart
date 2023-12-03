import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/extensions/email_validator_extension.dart';
import 'package:project_5/screens/auth/logic/sign_up_validators.dart';
import 'package:project_5/services/auth_api.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(LoadingState(isLoading: true));

      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        final response = await loginApi(email: event.email.trim(), password: event.password.trim());

        if (event.email.trim().isEmpty) {
          emit(AuthLoginErrorState(errorMsg: "Please Enter Your Email"));
          emit(LoadingState(isLoading: false));
        } else if (event.password.isEmpty) {
          emit(LoadingState(isLoading: false));
          emit(AuthLoginErrorState(errorMsg: "Please Enter Your Password"));
        } else if (response.toLowerCase() == "ok" ||
            response.toLowerCase() == "email not confirmed") {
          emit(LoadingState(isLoading: false));
          emit(AuthLoginSuccessState(type: "login", email: event.email.trim()));
        } else {
          emit(LoadingState(isLoading: false));
          emit(AuthLoginErrorState(errorMsg: "Email or Password are incorrect"));
        }
      } else {
        emit(AuthLoginErrorState(errorMsg: 'Please Fill The Required Fields'));
      }
    });

    on<AuthRegisterEvent>((event, emit) async {
      emit(LoadingState(isLoading: true));

      if (event.email.isNotEmpty && event.password.isNotEmpty && event.userName.isNotEmpty) {
        emit(LoadingState(isLoading: true));

        //TODO: FIX ERR STATE - SNACKBAR
        final isValidName = nameValidator(event.context, event.userName);
        final isValidEmail = emailValidation(event.email.isValidEmail(), event.context);
        final isValidPhone = phoneValidator(event.context, event.phone);
        final isValidPassword = passwordValidator(event.context, event.password);
        final isMatchPassword =
            confirmPasswordValidator(event.context, event.password, event.confirmPassword);

        if (isValidName && isValidEmail && isValidPhone && isValidPassword && isMatchPassword) {
          final response = await registerApi(
            name: event.userName,
            email: event.email,
            password: event.password,
            phone: event.phone,
          );

          if (response.toLowerCase() == "ok") {
            emit(LoadingState(isLoading: false));
            emit(AuthRegisterSuccessState(email: event.email, type: 'registration'));
          } else {
            emit(LoadingState(isLoading: false));
            emit(AuthRegisterErrorState(errorMsg: response));
          }
        } else {
          emit(LoadingState(isLoading: false));
        }
      } else {
        emit(AuthRegisterErrorState(errorMsg: 'Please Fill The Required Fields'));
      }
    });

    on<OTPEvent>((event, emit) async {
      emit(LoadingState(isLoading: true));
      if (event.otpCode.length < 6) {
        emit(AuthOTPErrorState(errorMsg: "Please Enter OTP"));
        emit(LoadingState(isLoading: false));
      } else {
        final response =
            await verificationApi(otp: event.otpCode, email: event.email, type: event.type);
        if (response.toLowerCase() == "ok") {
          emit(LoadingState(isLoading: false));
          emit(AuthOTPSuccessState());
        } else {
          emit(AuthOTPErrorState(errorMsg: "Wrong OTP $response"));
          emit(LoadingState(isLoading: false));
        }
      }
    });
  }
}
