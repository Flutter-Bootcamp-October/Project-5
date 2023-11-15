import 'package:cv_app/screens/get_started.dart';
import 'package:cv_app/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'GET STARTED',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: purble,
        ),
        skipTextButton: Text(
          'Skip',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        trailing: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetStarted()));
            },
            child: Text('Login',
                style: TextStyle(color: Colors.black, fontSize: 16))),
        background: [
          SizedBox(
              width: 313, height: 285, child: Image.asset('assets/Onl1.png')),
          SizedBox(
              width: 313,
              height: 285,
              child: Image.asset('assets/Online resume-pana 1.png')),
          SizedBox(
              width: 313,
              height: 285,
              child: Image.asset('assets/Online resume-amico 1.png')),
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 350,
                ),
                Text(
                  'make your self a better future',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 350,
                ),
                Text('make your the perfect resume',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 350,
                ),
                Text('find your dream job',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
