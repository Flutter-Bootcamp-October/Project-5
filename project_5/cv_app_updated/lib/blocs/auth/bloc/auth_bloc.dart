import 'package:bloc/bloc.dart';
import 'package:project_5/api_methods/auth_methods.dart';
import 'package:project_5/main.dart';

part 'auth_event.dart';
part 'auth_state.dart';

AuthMethodNetworking authMethod = AuthMethodNetworking();

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<SigninEvent>((event, emit) async {
      if (event.email!.isNotEmpty && event.password!.isNotEmpty) {
        try {
          final res = await authMethod.loginMethod(body: {
            "email": event.email,
            "password": event.password,
          });
          if (res.codeState == 200) {
            emit(SigninState());
          } else {
            emit(AuthErrorState(message: res.msg));
          }
        } on FormatException catch (error) {
          emit(AuthErrorState(
            message: error.message.toString(),
          ));
        }
      } else {
        emit(AuthErrorState(message: "Please fill the fields"));
      }
    });
    on<RegisterEvent>((event, emit) async {
      if (event.name!.isNotEmpty &&
          event.phone!.isNotEmpty &&
          event.email!.isNotEmpty &&
          event.password!.isNotEmpty) {
        try {
          final res = await authMethod.createAccount(body: {
            "name": event.name,
            "phone": event.phone,
            "email": event.email,
            "password": event.password,
          });
          if (res.codeState == 200) {
            emit(RegisterState());
          } else {
            emit(AuthErrorState(message: res.msg));
          }
        } on FormatException catch (error) {
          emit(AuthErrorState(message: error.message.toString()));
        }
      } else {
        emit(AuthErrorState(message: "please fill all the fields"));
      }
    });
    
    on<VerificattionEvent>((event, emit) async {
      if (event.otp!.isNotEmpty) {
        try {
          final res = await authMethod.verificationMethod(body: {
            "otp": event.otp,
            "email": event.email,
            "type": event.type,
          });
          if (res.codeState == 200) {
            pref?.setString("token", res.data.token);
            if (event.type == "registration") {
              emit(RegisterState());
            } else {
              if (event.type == "login") {
                emit(SigninState());
              }
            }
          } else {
            emit(AuthErrorState(message: res.msg));
          }
        } on FormatException catch (error) {
          emit(AuthErrorState(message: error.message.toString()));
        }
      }
    });
  }
}
