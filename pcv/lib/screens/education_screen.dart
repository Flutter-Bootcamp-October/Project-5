import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/screens/add_education_screen.dart';
import 'package:pcv/screens/drawer_screen.dart';
import 'package:pcv/services/education_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

List education = [];

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  bool empty = education.isEmpty;
  @override
  initState() {
    super.initState();
    _loedingEducation();
     Future.delayed(
      const Duration(seconds: 3),
      () {
        empty = false;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.pink, Colors.lightBlue])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarMethod(title: "education"),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 176, 165, 186),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddEducation(),
                ));
          },
          child: const Icon(Icons.add),
        ),
        drawer: const Drawer(
          child: DrawerScreens(),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (empty == true)
                const Center(child: CircularProgressIndicator()),
              if (education.isNotEmpty)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: education
                        .map((e) => InkWell(
                              onLongPress: () async {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                final token = prefs.getString('token');
                                educationNetwork.deleteEducationMethod(
                                    token: token!,
                                    body: {"id_education": e["id"]});
                                education.removeWhere(
                                    (element) => element["id"] == e["id"]);
                                setState(() {});
                              },
                              child: Card(
                                color: Colors.grey.shade100.withOpacity(0.6),
                                child: ListTile(
                                  title: Text("${e["university"]}"),
                                  subtitle: Text("${e["specialization"]}"),
                                  trailing: Text("${e["level"]}"),
                                ),
                              ),
                            ))
                        .toList())
            ],
          ),
        ),
      ),
    );
  }
   _loedingEducation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Response res = await educationNetwork.educationMethod(token: token!);
    try {
      if (res.statusCode == 200) {
        education = (await jsonDecode(res.body))["data"];
        setState(() {});
        // ignore: empty_catches
      }
    } catch (error) {
      //
    }
  }
}
