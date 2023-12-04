import 'package:cv_app/screens/login_screen.dart';
import 'package:cv_app/screens/registration_screen.dart';
import 'package:cv_app/styles/colors.dart';
import 'package:cv_app/widgets/custom_bottom.dart';

import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bg,
        body: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image.asset("assets/Add User-rafiki 1.png"),
              ),
            ),
            Column(
              children: [
                CustomBottom(
                  color: Colors.white,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  border: orang,
                  text: 'LOGIN',
                ),
                SizedBox(
                  height: 12,
                ),
                CustomBottom(
                  border: purble,
                  color: purble,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ));
                  },
                  text: 'SIGN UP',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
