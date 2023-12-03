import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_resume/model/skill_model.dart';
import 'package:project_resume/networking/api_service.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _MyWidgetState();
}

TextEditingController conSkill = TextEditingController();
List<Data> listSkill = [];

class _MyWidgetState extends State<SkillsScreen> {
  _loadSkill() async {
    try {
      final Skill res = await getSkill();
      listSkill = res.data!;
      setState(() {});
    } on FormatException catch (error) {
      print("-----");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message.toString())));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSkill();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 127, 33),
        title: const Text('Skills'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (listSkill.isEmpty)
              const Center(
                child: Text("No data"),
              ),
            if (listSkill.isNotEmpty)
              Column(
                children: listSkill
                    .map((item) => InkWell(
                          onLongPress: () async {
                            try {
                              final res = await deleteSkill(
                                idSkill: item.id.toString(),
                              );
                              listSkill.remove(item);

                              setState(() {});
                            } on FormatException catch (error) {
                              print("-----");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(error.message.toString())));
                            }
                          },
                          child: ListTile(
                            title: Text(item.skill.toString()),
                          ),
                        ))
                    .toList(),
              ),
            Row(
              children: [
                const Text(
                  'Tap here to add your Skill ->',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 500,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(13),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    TextField(
                                      controller: conSkill,
                                      decoration: const InputDecoration(
                                        label: Text("Enter skill name"),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            child: const Text('SAVE'),
                                            onPressed: () async {
                                              final res = await addSkill(
                                                skillData: conSkill.text,
                                              );
                                              print("res body: ${res.body}");
                                              if (res.statusCode == 200) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Information Saved Successfully'),
                                                  ),
                                                );

                                                _loadSkill();
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        (await jsonDecode(res
                                                                .body))["msg"]
                                                            .toString()),
                                                  ),
                                                );
                                              }
                                              Navigator.of(context).pop();
                                            }),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        ElevatedButton(
                                          child: const Text('CANCEL'),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: const Icon(
                    Icons.add,
                    size: 40,
                    color: Color.fromARGB(255, 25, 128, 28),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
