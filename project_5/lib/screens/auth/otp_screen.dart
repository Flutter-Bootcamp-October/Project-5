// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/bloc/auth_bloc/auth_bloc.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/auth/components/auth_loading.dart';
import 'package:project_5/screens/profile/profile_screen.dart';
import 'package:project_5/services/auth_api.dart';
import 'package:project_5/widgets/sized_box.dart';
import 'package:project_5/widgets/snack_bar.dart';

import 'components/otp_fields.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key, required this.emailAddress, required this.type}) : super(key: key);

  final TextEditingController otpController = TextEditingController();
  final String emailAddress;
  final String type;
  @override
  Widget build(BuildContext context) {
    FocusNode focusNode1 = FocusNode();
    FocusNode focusNode2 = FocusNode();
    FocusNode focusNode3 = FocusNode();
    FocusNode focusNode4 = FocusNode();
    FocusNode focusNode5 = FocusNode();
    FocusNode focusNode6 = FocusNode();

    List<FocusNode> focusNodeList = [
      focusNode1,
      focusNode2,
      focusNode3,
      focusNode4,
      focusNode5,
      focusNode6,
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedBoxH(context: context, multiplier: .13),
              const Text("OTP", style: TextStyle(fontSize: 30)),
              Text(
                textAlign: TextAlign.center,
                "Please check your email for the code sent to $emailAddress",
                style: const TextStyle(fontSize: 20),
              ),
              sizedBoxH(context: context, multiplier: .18),
              SizedBox(
                height: 60,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(width: 5),
                  itemCount: focusNodeList.length,
                  itemBuilder: (context, index) => OTPField(
                      focusNodeList: focusNodeList, index: index, controller: otpController),
                ),
              ),
              sizedBoxH(context: context, multiplier: .095),
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  return AuthButton(
                    content: "Send",
                    color: Colors.grey[200]!,
                    isDisabled: false,
                    onPressedFunc: () {
                      context.read<AuthBloc>().add(
                            OTPEvent(email: emailAddress, type: type, otpCode: otpController.text),
                          );
                    },
                  );
                },
                listener: (BuildContext context, AuthState state) {
                  state is AuthOTPErrorState
                      ? showSnackBar(context: context, message: state.errorMsg)
                      : SystemChannels.textInput.invokeMethod('TextInput.show');
                  if (state is AuthOTPSuccessState) {
                    navigation(context: context, type: "pushRemove", screen: const ProfileScreen());
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  } else {
                    const SizedBox();
                  }
                },
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    otpController.clear();
                  }
                  return state is LoadingState
                      ? state.isLoading
                          ? showLoadingIndicator()
                          : const SizedBox()
                      : const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
