// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/profile/profile_screen.dart';
import 'package:project_5/services/auth_api.dart';

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
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                      controller: controller),
                ),
              ),
              const SizedBox(height: 75),
              SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple),
                    onPressed: () async {
                      if (controller.text.length < 4) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please Enter OTP")));
                      } else {
                        final response = await verificationApi(
                            otp: controller.text,
                            email: widget.emailAddress,
                            type: widget.type);
                        if (response.toLowerCase() == "ok") {
                          navigationPush(
                              context: context, screen: const ProfileScreen());
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(response)));
                        }
                      }
                    },
                    child: const Text(
                      "Send",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
