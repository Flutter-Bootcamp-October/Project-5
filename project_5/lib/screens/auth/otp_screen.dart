// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/auth/components/auth_loading.dart';
import 'package:project_5/screens/profile/profile_screen.dart';
import 'package:project_5/services/auth_api.dart';
import 'package:project_5/widgets/snack_bar.dart';

import 'components/otp_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key, required this.emailAddress, required this.type})
      : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
  final String emailAddress;
  final String type;
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  bool isLoading = false;
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
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 90),
              const Text(
                "OTP",
                style: TextStyle(color: Colors.deepPurple, fontSize: 30),
              ),
              Text(
                textAlign: TextAlign.center,
                "Please check your email for the code sent to ${widget.emailAddress}",
                style: const TextStyle(color: Colors.deepPurple, fontSize: 20),
              ),
              const SizedBox(height: 140),
              SizedBox(
                height: 60,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 5),
                  itemCount: focusNodeList.length,
                  itemBuilder: (context, index) => OTPField(
                      focusNodeList: focusNodeList,
                      index: index,
                      controller: _otpController),
                ),
              ),
              const SizedBox(height: 75),
              AuthButton(
                color: Colors.grey[200]!,
                content: "Send",
                isDisabled: false,
                onPressedFunc: () async {
                  isLoading = true;
                  setState(() {});
                  if (_otpController.text.length < 4) {
                    showSnackBar(context: context, message: "Please Enter OTP");
                    isLoading = false;
                  } else {
                    final response = await verificationApi(
                        otp: _otpController.text,
                        email: widget.emailAddress,
                        type: widget.type);
                    if (response.toLowerCase() == "ok") {
                      isLoading = false;
                      navigation(
                          type: "push",
                          context: context,
                          screen: const ProfileScreen());
                    } else {
                      showSnackBar(
                          context: context, message: "Wrong OTP $response");
                      isLoading = false;
                    }
                  }
                  SystemChannels.textInput.invokeMethod('TextInput.show');
                  setState(() {});
                },
              ),
              isLoading ? showLoadingIndicator() : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
