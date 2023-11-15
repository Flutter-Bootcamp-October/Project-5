import 'package:flutter/material.dart';
import 'package:project_5/api/about.dart';
import 'package:project_5/model/Token.dart';
import 'package:project_5/model/user_model.dart';
import 'package:project_5/screens/login_screen.dart';
import 'package:project_5/screens/update_page.dart';
import 'package:project_5/widgets/buildprofileDetailRow.dart';
import 'package:project_5/widgets/delete.dart';
import 'package:http/http.dart' as http;

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
              UserdataCard(),
              FutureBuilder<UserData>(
                future: user,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    UserData userData = snapshot.data!;
                    return Column(
                      children: [
                        buildProfileDetailRow(
                          'title_position',
                          userData.titlePosition.toString(),
                          'Academic Year',
                          userData.about.toString(),
                        ),
                        buildProfileDetailRow('phone', userData.phone,
                            'location', userData.location.toString()),
                        buildProfileDetailRow(
                            'about',
                            userData.about.toString(),
                            'Date of Birth',
                            userData.birthday.toString()),
                      ],
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Update()),
                      );
                    },
                    child: Text("Update"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        http.Response response = await About().postUploadImg();
                        if (response.statusCode == 200) {
                          print('Image upload successful');
                        } else {
                          print(
                              'Image upload failed with status code: ${response.statusCode}');
                        }
                      } catch (error) {
                        print('Error during image upload: $error');
                      }
                    },
                    child: Text("Update img"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Token().deleteToken();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text("Logout"),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(""),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(""),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(""),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<UserData> UserdataCard() {
    return FutureBuilder<UserData>(
      future: user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          UserData userData = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 29, 29, 39),
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularButtonDelete(
                      onPressed: () {
                        About().deleteAccount();
                        Token().deleteToken();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        maxRadius: 50,
                        minRadius: 50,
                        backgroundColor: Color.fromARGB(118, 255, 193, 7),
                        backgroundImage: NetworkImage(userData.image ??
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/FullMoon2010.jpg/1200px-FullMoon2010.jpg"),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Name: ${userData.name}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
