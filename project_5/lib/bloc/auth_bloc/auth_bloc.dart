import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/services/auth_api.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(LoadingState(isLoading: true));

      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        final response = await loginApi(
            email: event.email.trim(), password: event.password.trim());

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
          emit(
              AuthLoginErrorState(errorMsg: "Email or Password are incorrect"));
        }
      } else {
        emit(AuthLoginErrorState(errorMsg: 'Please Fill The Required Fields'));
      }
    });

    on<AuthRegisterEvent>((event, emit) {
      if (event.email.isNotEmpty &&
          event.password.isNotEmpty &&
          event.userName.isNotEmpty) {
        List doesExists = [];
        // for (var item in usersList) {
        //   if (item.email!.contains(event.email.trim().toLowerCase())) {
        //     doesExists.add(true);
        //   }
        // }
        if (!doesExists.contains(true)) {
          // currentUser = User(
          //   address: [],
          //   userAvatar: "",
          //   email: event.email.trim(),
          //   password: event.password.trim(),
          //   mobileNumber: '',
          //   name: event.userName.trim(),
          // );
          // loggedInUsers.add(currentUser);
          // usersList.add(currentUser);
          emit(AuthRegisterSuccessState(
              type: "register", email: event.email.trim()));
        } else {
          emit(AuthRegisterErrorState(errorMsg: 'Account Exists'));
        }
      } else {
        emit(AuthRegisterErrorState(
            errorMsg: 'Please Fill The Required Fields'));
      }
    });
    on<OTPEvent>((event, emit) async {
      emit(LoadingState(isLoading: true));
      if (event.otpCode.length < 6) {
        emit(AuthOTPErrorState(errorMsg: "Please Enter OTP"));
        emit(LoadingState(isLoading: false));
      } else {
        final response = await verificationApi(
            otp: event.otpCode, email: event.email, type: event.type);
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
