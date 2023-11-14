import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/models/skill_model.dart';
import 'package:project_5/screens/auth/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  @override
  void initState() {
    // get skils in init
    super.initState();

    _loadSkills();
  }

  List<SkillModel> skilList = [];
  final apimethod = ApiMethods();

  TextEditingController skillname = TextEditingController(),
      skillID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // show model bottom sheet to add new skils
          showModalBottomSheet(
            context: context,
            builder: (context) => SizedBox(
              height: 275,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      "Add New Skill",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputTextFields(
                      title: 'Enter skill name',
                      controller: nameController,
                    ),
                    InputTextFields(
                      title: 'Enter skill id',
                      controller: skillID,
                    ),
                    ElevatedButton(
                      // style: ,
                      onPressed: () async {
                        // add skill function
                        try {
                          final SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          final token = pref.getString('token');
                          final SkillModel =
                              await apimethod.addSkill(token: token!, body: {
                            "id": int.parse(skillID.text),
                            "skill": skillname.text,
                          });
                          Navigator.pop(context);
                        } on FormatException catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(error.message.toString())));
                        }
                      },
                      child: const Text("add skill"),
                    ),
                  ],
                ),
              ),
            ),
          ).then((value) => Future.delayed(const Duration(seconds: 1)));
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (skilList.isEmpty) const Text("No skills added"),
          if (skilList.isNotEmpty)
            Column(
                children: skilList
                    .map((e) => ListTile(
                          leading: Text(e.data.id.toString()),
                          title: Text(e.data.skill),
                          trailing: InkWell(
                            onTap: () async {
                              final SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              final token = pref.getString('token');
                              final ApiMethods res =
                                  await apimethod.removeSkill(
                                      token: token!,
                                      idSkill: e.data.id.toString());
                              skilList.remove(e);
                              setState(() {});
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ))
                    .toList())
        ],
      ),
    );
  }

  _loadSkills() async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');
      final SkillModel res = await apimethod.getSkill(token: token!);
    } on FormatException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message.toString())));
    }
  }
}

class InputTextFields extends StatelessWidget {
  const InputTextFields({
    super.key,
    required this.controller,
    required this.title,
  });
  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            label: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )),
      ),
    );
  }
}
