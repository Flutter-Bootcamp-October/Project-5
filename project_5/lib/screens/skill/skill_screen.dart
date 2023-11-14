import 'package:flutter/material.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/global/globally.dart';
import 'package:project_5/models/skill_model.dart';

import '../components/button_widget.dart';
import '../components/input_text_fields.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  
  final apimethod = ApiMethods();

  TextEditingController skillController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Skills",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue.shade900,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(206, 13, 72, 161),
        child: Icon(Icons.add),
        onPressed: () {
          // show model bottom sheet to add new skils
          showModalBottomSheet(
            context: context,
            builder: (context) => Builder(builder: (context) {
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 75, bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        "Add New Skill",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFields(
                        title: 'Enter skill name',
                        controller: skillController,
                        lines: 1,
                      ),
                      ButtonWidget(
                        textEntry: 'Add Skill',
                        onpress: () async {
                          // add skill api function
                          try {
                            final element = await apimethod.addSkill(body: {
                              "skill": skillController.text,
                            });
                            skillList.add(element);
                            Navigator.pop(context);
                            setState(() {});
                          } on FormatException catch (error) {
                            print("error");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(error.message.toString())));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
          ).then((value) => Future.delayed(const Duration(seconds: 1)));
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<SkillModel>(
              future: apimethod.getSkill(),
              builder:
                  (BuildContext context, AsyncSnapshot<SkillModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  print(snapshot.data?.data);
                  if (snapshot.data!.data!.isNotEmpty) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Card(
                              color: Colors.blue.shade50,
                              child: ListTile(
                                leading: Text(
                                  "ID: ${snapshot.data!.data![index].id}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                title: Text(
                                  "${snapshot.data!.data![index].skill}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: InkWell(
                                  onTap: () async {
                                    await apimethod.removeSkill(
                                        idSkill: snapshot.data!.data![index].id
                                            .toString());
                                    skillList
                                        .remove(snapshot.data!.data![index].id);
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red.shade200,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(child: Text("No Skills added"));
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
