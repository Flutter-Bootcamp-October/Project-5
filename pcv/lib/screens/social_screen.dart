import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pcv/screens/add_skill.dart';
import 'package:pcv/screens/add_social.dart';
import 'package:pcv/screens/drawer_screen.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  List social = [];

  @override
  void initState() {
    super.initState();
    _loedingSocial();
  }

  _loedingSocial() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Response res = await network.socialMethod(token: token!);
    try {
      if (res.statusCode == 200) {
        social = (await jsonDecode(res.body))["data"];
        setState(() {});
        // ignore: empty_catches
      }
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DrawerScreens(),
      ),
      backgroundColor: const Color.fromARGB(255, 104, 87, 186),
      appBar: AppBar(
        title: const Text('social'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 176, 165, 186),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddSocial(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (social.isEmpty)
                const Center(child: CircularProgressIndicator()),
            if (social.isNotEmpty)
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: social
                      .map((e) => InkWell(
                            onLongPress: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              final token = prefs.getString('token');
                              network.deleteProjectMethod(
                                  token: token!, body: {"id_skill": e["id"]});
                              social.removeWhere(
                                  (element) => element["id"] == e["id"]);
                              setState(() {});
                            },
                            child: Card(
                              color: Colors.grey.shade100.withOpacity(0.6),
                              child: ListTile(
                                title: Text("${e["username"]}"),
                                subtitle: Text(e["social"]),
                              ),
                            ),
                          ))
                      .toList())
          ],
        ),
      ),
    );
  }
}
