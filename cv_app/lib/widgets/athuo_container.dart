// import 'package:cv_app/screens/about_screen.dart';
// import 'package:cv_app/screens/get_started.dart';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthoContainer extends StatefulWidget {
//   const AuthoContainer({Key? key}) : super(key: key);

//   @override
//   State<AuthoContainer> createState() => _AuthoContainerState();
// }

// class _AuthoContainerState extends State<AuthoContainer> {
//   late String? token;
//   bool initial = true;

//   @override
//   void initState() {
//     super.initState();
//     getTokenFromPreferences();
//   }

//   Future<void> getTokenFromPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     setState(() {
//       initial = false;
//       token = prefs.getString('token');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (initial) {
//       return CircularProgressIndicator();
//     } else {
//       if (token == null) {
//         return GetStarted();
//       } else {
//         return AboutScreen();
//       }
//     }
//   }
// }
