import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/models/skill_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // show model bottom sheet to add new skils
          }),
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
          if (skilList.isEmpty) Text("No skills added"),
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
