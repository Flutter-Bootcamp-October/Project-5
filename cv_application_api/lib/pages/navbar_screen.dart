import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/pages/profile_screnn.dart';
import 'package:cv_application_api/pages/skills_screen.dart';
import 'package:cv_application_api/widgets/background_widget/background_image.dart';
import 'package:cv_application_api/widgets/background_widget/background_white_container.dart';
import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

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
              children: const <Widget>[ProfileScreen(), QualificationScreen()]),
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
            RollingBottomBarItem(Icons.home, label: "", activeColor: appWhite),
            RollingBottomBarItem(Icons.home, label: "", activeColor: appWhite)
          ],
          onTap: (index) {
            pageControlller.animateToPage(index,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut);
          }),
    ));
  }
}
