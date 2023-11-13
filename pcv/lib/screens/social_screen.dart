import 'package:flutter/material.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/screens/add_social.dart';
import 'package:pcv/screens/drawer_screen.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

List social = [];

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  @override
  Widget build(BuildContext context) {
    return Container( decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.pink, Colors.lightBlue])),
      child: Scaffold(
        drawer: const Drawer(
          child: DrawerScreens(),
        ),
        backgroundColor: Colors.transparent,
        appBar: appBarMethod(title: "Social"),
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
      ),
    );
  }
}
