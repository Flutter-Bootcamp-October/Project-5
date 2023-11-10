import 'package:flutter/material.dart';
import 'package:resume_app/models/about_model.dart';
import 'package:resume_app/services/about_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.token});
  final String token;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    testMethod();
    return const Scaffold(
        // body: FutureBuilder(
        //     future: userAbout = AboutServ().getAbout(token: widget.token),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         try {
        //           return Center(
        //             child: Padding(
        //                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //                 child: InkWell(
        //                     onTap: () async {
        //                       userAbout.birthday = "9/30/1997";
        //                       try {
        //                         final response = AboutServ().editAbout(
        //                             token: widget.token, userAbout: userAbout);
        //                         ScaffoldMessenger.of(context).showSnackBar(
        //                             SnackBar(content: Text(response)));
        //                       } on FormatException catch (error) {
        //                         ScaffoldMessenger.of(context).showSnackBar(
        //                             SnackBar(
        //                                 content: Text(error.message.toString())));
        //                       }
        //                     },
        //                     child: Text(userAbout.toJson().toString()))),
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
    About userAbout = await AboutServ().getAbout(token: widget.token);
    // print("______________LOOK HERE_________________");
    //print(userAbout.toJson().toString());
    print("______________LOOK HERE_________________");
    userAbout.birthday = "9/30/1997";
    await AboutServ().editAbout(token: widget.token, userAbout: userAbout);
    print("______________LOOK HERE_________________");
  }
}
