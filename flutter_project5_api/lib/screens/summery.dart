import 'package:flutter/material.dart';
import 'package:flutter_project5_api/models/about.dart';
import 'package:flutter_project5_api/models/education.dart';
import 'package:flutter_project5_api/models/project.dart';
import 'package:flutter_project5_api/models/skills.dart';
import 'package:flutter_project5_api/models/social.dart';
import 'package:flutter_project5_api/servers_api/about/user_about_api.dart';
import 'package:flutter_project5_api/servers_api/educatio/user_education_api.dart';
import 'package:flutter_project5_api/servers_api/project/user_projects_api.dart';
import 'package:flutter_project5_api/servers_api/skills/users_skills_api.dart';
import 'package:flutter_project5_api/servers_api/social/user_socialm_api.dart';

class CVScreen extends StatefulWidget {
  final String? token;

  const CVScreen({Key? key, this.token}) : super(key: key);

  @override
  _CVScreenState createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  late Future<About> aboutFuture;
  late Future<Education> educationFuture;
  late Future<Project> projectsFuture;
  late Future<Skills> skillsFuture;
  late Future<SocialMedia> socialMediaFuture;

  @override
  void initState() {
    super.initState();
    aboutFuture = getabout(token: widget.token ?? '');
    educationFuture = educatiion(token: widget.token ?? '');
    projectsFuture = projects(token: widget.token ?? '');
    skillsFuture = skillss(token: widget.token ?? '');
    socialMediaFuture = socialmedia(token: widget.token ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My CV'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder<About>(
              future: aboutFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No data available');
                }

                final about = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'About Me',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    Text('Name: ${about.data!.name}'),
                    Text('Bio: ${about.data!.about}'),
                   
                  ],
                );
              },
            ),
            SizedBox(height: 20.0),
            
          ],
        ),
      ),
    );
  }
}
