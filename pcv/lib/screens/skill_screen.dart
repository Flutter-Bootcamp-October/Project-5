import 'package:flutter/material.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/screens/add_skill.dart';
import 'package:pcv/screens/drawer_screen.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

List skills = [];

class SkillScreen extends StatefulWidget {
  const SkillScreen({super.key});

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
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
        appBar: appBarMethod(title: "Skills"),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 176, 165, 186),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddSkill(),
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
              if (skills.isEmpty)
                const Center(child: CircularProgressIndicator()),
              if (skills.isNotEmpty)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: skills
                        .map((e) => InkWell(
                              onLongPress: () async {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                final token = prefs.getString('token');
                                network.deleteSkillMethod(
                                    token: token!, body: {"id_skill": e["id"]});
                                skills.removeWhere(
                                    (element) => element["id"] == e["id"]);
                                setState(() {});
                              },
                              child: Card(
                                color: Colors.grey.shade100.withOpacity(0.6),
                                child: ListTile(
                                  title: Text("${e["skill"]}"),
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
