import 'package:flutter/material.dart';
import 'package:project_5/api/about.dart';
import 'package:project_5/model/user_model.dart';
import 'package:project_5/widgets/delete.dart';
import 'package:project_5/widgets/user_dataa.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<UserData> user;

  @override
  void initState() {
    super.initState();
    user = About().getUserAbout();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/signin_balls.png"),
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                      child: Text(
                        "My Profile ",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FutureBuilder<UserData>(
                future: user,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    UserData userData = snapshot.data!;
                    return UserProfileWidget(
                      userData: userData,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
