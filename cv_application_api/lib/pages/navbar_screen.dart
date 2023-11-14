// ignore_for_file: use_build_context_synchronously

import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/pages/education_screen.dart';
import 'package:cv_application_api/pages/login_screen.dart';
import 'package:cv_application_api/pages/profile_screen.dart';
import 'package:cv_application_api/pages/qualification_screen.dart';
import 'package:cv_application_api/widgets/background_widget/background_image.dart';
import 'package:cv_application_api/widgets/background_widget/background_white_container.dart';
import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageControlller = PageController();

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundImage(),
          const BackgroundWhiteContainer(),
          PageView(
            controller: pageControlller,
            children: const <Widget>[
              ProfileScreen(),
              EducationScreen(),
              QualificationScreen(),
            ],
          ),
          IconButton(
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();

                prefs.clear();

                Navigator.push(
                    context,
                    (MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    })));
              },
              icon: const Icon(
                Icons.logout,
                size: 30,
                color: app2DarkGreen,
              ))
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
          itemColor: app1DarkGreen,
          enableIconRotation: true,
          color: appGreenTrans,
          flat: true,
          useActiveColorByDefault: false,
          controller: pageControlller,
          items: const [
            RollingBottomBarItem(Icons.person,
                label: "", activeColor: appWhite),
            RollingBottomBarItem(Icons.school,
                label: "", activeColor: appWhite),
            RollingBottomBarItem(Icons.my_library_books_outlined,
                label: "", activeColor: appWhite)
          ],
          onTap: (index) {
            pageControlller.animateToPage(index,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut);
          }),
    ));
  }
}
