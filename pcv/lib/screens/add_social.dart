// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/screens/social_screen.dart';
import 'package:pcv/services/social_network.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddSocial extends StatefulWidget {
  const AddSocial({super.key});

  @override
  State<AddSocial> createState() => _AddSocialState();
}

const List<String> _socialList = <String>[
  'facebook',
  'youtube',
  'whatsapp',
  'instagram',
  'twitter',
  'tiktok',
  'telegram',
  'snapchat',
  'other'
];

class _AddSocialState extends State<AddSocial> {
  String dropdownValue = _socialList.first;
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.pink, Colors.lightBlue])),
      child: Scaffold(
        appBar: appBarMethod(title: "Add Social"),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
                text: 'username', obscure: false, controller: usernameController),
            DropdownMenu<String>(
              width: MediaQuery.of(context).size.width * 0.9,
              inputDecorationTheme: const InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(25),
                          right: Radius.circular(25)))),
              initialSelection: _socialList.first,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  _socialList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry(value: value, label: value);
              }).toList(),
            ),
            ButtonWidget(
                onPressed: () async {
                  try {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final token = prefs.getString('token');
                    final Response resp = await socialNetwork.addsocialMethod(
                        token: token!,
                        body: {
                          "username": usernameController.text,
                          "social": dropdownValue
                        });
    
                    if (resp.statusCode == 200) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SocialScreen()),
                          (Route<dynamic> route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              (await jsonDecode(resp.body))["msg"].toString())));
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                text: 'Add')
          ],
        ),
      ),
    );
  }
}
