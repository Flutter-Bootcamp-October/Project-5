import 'package:cv_app/model/otp.dart';
import 'package:cv_app/screens/about_screen.dart';
import 'package:cv_app/screens/progress_screen.dart';
import 'package:cv_app/screens/project_screen.dart';
import 'package:cv_app/services/otp_service.dart';
import 'package:cv_app/styles/colors.dart';
import 'package:cv_app/widgets/custom_bottom.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email, required this.type});

  final String email;
  final String type;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 388,
                    height: 338,
                    child: Image.asset("assets/Enter OTP-rafiki 1.png"),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "OTP Verification",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Enter the OTP code sent to your Email",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          widget.email,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    title: Text(''),
                    subtitle: TextFormField(
                      controller: otpController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            CustomBottom(
              color: orang,
              border: orang,
              text: "Confirmation",
              ontap: () async {
                try {
                  final Verified res = await otp({
                    "otp": otpController.text,
                    "email": widget.email,
                    "type": widget.type
                  });
                  // token = res.data.token
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("token", res.data!.token.toString());
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => TabProgress()),
                    (Route<dynamic> route) => false,
                  );
                } on FormatException catch (error) {
                  print("-----");
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error.message.toString())));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
