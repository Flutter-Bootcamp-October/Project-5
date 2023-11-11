import 'package:flutter/material.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/about_model.dart';
import 'package:resume_app/services/about_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    testMethod();
    return const Scaffold(
        // body: FutureBuilder(
        //     future: AboutServ().getAbout(token: widget.token),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         try {
        //           return const Center(
        //             child: Padding(
        //                 padding: EdgeInsets.symmetric(horizontal: 16.0),
        //                 child: InkWell(
        //                     // onTap: () async {
        //                     //   userAbout.birthday = "9/30/1997";
        //                     //   try {
        //                     //     final response = AboutServ().editAbout(
        //                     //         token: widget.token, userAbout: userAbout);
        //                     //     ScaffoldMessenger.of(context).showSnackBar(
        //                     //         SnackBar(content: Text(response)));
        //                     //   } on FormatException catch (error) {
        //                     //     ScaffoldMessenger.of(context).showSnackBar(
        //                     //         SnackBar(
        //                     //             content: Text(error.message.toString())));
        //                     //   }
        //                     // },
        //                     // child: Text(userAbout.toJson().toString()))),
        //                     child: Text("getData(snapshot.data)"))),
        //           );
        //         } on FormatException catch (error) {
        //           ScaffoldMessenger.of(context).showSnackBar(
        //               SnackBar(content: Text(error.message.toString())));
        //           return const Text("no data available for user at this time");
        //         }
        //       } else {
        //         return const Center(child: LinearProgressIndicator());
        //       }
        //     }),
        );
  }

  void testMethod() async {
    About x = await AboutServ().getAbout(token: getToken());
    print(x.toJson().toString());
    //print("______________LOOK HERE_________________");
    x.birthday = "9/30/1997";
    print(x.toJson().toString());
    try {
      await AboutServ().editAbout(token: getToken(), userAbout: x);
    } on FormatException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message.toString())));
    }
    //print("______________LOOK HERE_________________");
    // await AboutServ().deleteAccount(token: widget.token);
    // prefs.clear();
  }

  String getToken() {
    print("in getToken: ${prefs.getString("token")}");
    return prefs.getString("token") ?? "";
  }
}
