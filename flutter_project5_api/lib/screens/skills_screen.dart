import 'package:flutter/material.dart';
import 'package:flutter_project5_api/servers_api/skills/del_skills_api.dart';
import 'package:flutter_project5_api/widgets/custom_button.dart';
import 'package:flutter_project5_api/widgets/textfelides.dart';
import 'package:flutter_project5_api/servers_api/skills/add_skills_api.dart';

import 'package:flutter_project5_api/models/skills.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

class SkillScreen extends StatefulWidget {
  const SkillScreen({Key? key}) : super(key: key);

  @override
  _SkillScreenState createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  final List<Data> skills = [];

  TextEditingController skillNameController = TextEditingController();

  void _addSkill() async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Your Skill',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              CustomTextField(
                hint: 'Skill Name',
                controller: skillNameController,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  await _saveSkillAPI();
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  _saveSkillAPI() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await addskills(
        token: token!,
        body: {'skill': skillNameController.text},
      );

      if (response.codeState == 200) {
        _saveSkillModel(response.data!);
        skillNameController.clear();
      } else {
        print("Failed to add skill. Error: ${response.msg}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  void _saveSkillModel(Data skill) {
    setState(() {
      skills.add(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Skills',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: _addSkill,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Color.fromARGB(255, 26, 8, 90),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: skills
                      .asMap()
                      .map(
                        (index, skill) => MapEntry(
                          index,
                          Card(
                           
                            margin: EdgeInsets.only(bottom: 16.0),
                            child: ListTile(
                              title: Text(skill.skill!),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => _deleteSkill(index),
                              ),
                            ),
                          ),
                        ),
                      )
                      .values
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteSkill(int index) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await deleteskills(
        token: token!,
        body: {'id_skill': skills[index].id},
      );

      if (response.codeState == 200) {
        _removeSkill(index);
      } else {
        print("Failed to delete skill. Error: ${response.msg}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  void _removeSkill(int index) {
    setState(() {
      skills.removeAt(index);
    });
  }
}
