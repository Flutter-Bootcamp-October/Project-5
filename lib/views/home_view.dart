import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_5/views/about/edit_about_view.dart';
import 'package:project_5/views/education/edit_education_view.dart';
import 'package:project_5/views/projects/edit_projects_view.dart';
import 'package:project_5/views/social/edit_social_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xfff3f3f3),
                )),
            Padding(
              padding: const EdgeInsets.all(1),
              child: SizedBox(
                height: 450,
                width: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Card(
                      color: Color(0xfff4effb),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xfff3f3f3),
                              )),
                          ListTile(
                            leading: Icon(Icons.person_2_outlined),
                            title: Text(
                              'About',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EditAboutView()));
                                },
                                child: Icon(Icons.edit)),
                          ),
                          ListTile(
                            leading: Text(
                              'ID:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Name:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Title:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Phone:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Location:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Birthday:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: SizedBox(
                height: 450,
                width: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Card(
                    color: Color(0xfffbf4ed),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.school_outlined),
                          title: Text(
                            'Education',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: InkWell(
                              onTap: () => EditEducationView(),
                              child: Icon(Icons.edit)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: SizedBox(
                height: 450,
                width: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Card(
                    color: Color(0xfff0f6f5),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.memory_outlined),
                          title: Text(
                            'Skills',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: InkWell(child: Icon(Icons.edit)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: SizedBox(
                height: 450,
                width: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Card(
                    color: Color(0xfffaeff4),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text(
                            'Projects',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: InkWell(
                              onTap: () => EditProjectsView(),
                              child: Icon(Icons.edit)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: SizedBox(
                height: 450,
                width: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Card(
                    color: Color(0xfff3f3f3),
                    child: Column(children: [
                      ListTile(
                        leading: Icon(Icons.phone_android_outlined),
                        title: Text(
                          'Social',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: InkWell(
                            onTap: () => const EditSocialView(),
                            child: Icon(Icons.edit)),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
