// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/api_methods/auth_methods.dart';
import 'package:project_5/blocs/auth/bloc/auth_bloc.dart';
import 'package:project_5/screens/components/button_widget.dart';
import 'package:project_5/screens/home/home_screen.dart';
import 'package:project_5/screens/auth/signin_screen.dart';
import 'package:project_5/utils/loading_widget.dart';

import '../components/input_text_fields.dart';

class AccountVerification extends StatelessWidget {
  const AccountVerification(
      {super.key, required this.email, required this.type});

  final String email;
  final String type;
  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "OTP",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.blue.shade900,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enter OTP",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              InputTextFields(
                controller: otpController,
                title: "Enter otp",
                lines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) async {
                  loadingWidget(context: context);
                  var res =
                      await AuthMethodNetworking().verificationMethod(body: {
                    "otp": otpController.text,
                    "email": email,
                    "type": type,
                  });
                  try {
                    if (state is RegisterState) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SigninScreen())));
                    } else if (state is SigninState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else if (state is AuthErrorState) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(res.msg),
                      ));
                    }
                  } on FormatException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        e.message.toString(),
                      ),
                    ));
                  }
                },
                child: ButtonWidget(
                  textEntry: "submit OTP",
                  onpress: () async {
                    context.read<AuthBloc>().add(VerificattionEvent(
                        otp: otpController.text, email: email, type: type));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
