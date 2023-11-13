// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/screens/project_screen.dart';
import 'package:pcv/services/project_api.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

const List<String> list = <String>['completed', 'processing', 'other'];

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  String dropdownValue = list.first;
  TextEditingController usernameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController descripController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.pink, Colors.lightBlue])),
      child: Scaffold(
          appBar: appBarMethod(title: 'Add Project'),
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFieldWidget(
                      text: 'name',
                      obscure: false,
                      controller: usernameController,
                    ),
                    TextFieldWidget(
                      text: 'Description',
                      obscure: false,
                      controller: descripController,
                    ),
                    DropdownMenu<String>(
                      width: MediaQuery.of(context).size.width * 0.9,
                      inputDecorationTheme: const InputDecorationTheme(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(25),
                                  right: Radius.circular(25)))),
                      initialSelection: list.first,
                      onSelected: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      dropdownMenuEntries:
                          list.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry(value: value, label: value);
                      }).toList(),
                    ),
                    ButtonWidget(
                      onPressed: () async {
                        try {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          final token = prefs.getString('token');
                          final Response resp = await projectNet
                              .addProjectMethod(token: token!, body: {
                            "name": usernameController.text,
                            "description": descripController.text,
                            "state": dropdownValue,
                          });

                          if (resp.statusCode == 200) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProjectScreen()),
                                (Route<dynamic> route) => false);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    (await jsonDecode(resp.body))["msg"]
                                        .toString())));
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
                        }
                      },
                      text: 'Add',
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
