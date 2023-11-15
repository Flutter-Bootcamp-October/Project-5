import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_resume/model/project_model.dart';
import 'package:project_resume/networking/api_service.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _MyWidgetState();
}

TextEditingController conState = TextEditingController();
TextEditingController conName = TextEditingController();
TextEditingController conDescription = TextEditingController();
String selectedValue = 'completed';
List<Data> projectList = [];

class _MyWidgetState extends State<ProjectScreen> {
  @override
  @override
  _loadProject() async {
    try {
      final Project res = await getProject();
      projectList = res.data!;
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
    _loadProject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 142, 188),
        title: const Text('Project'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (projectList.isEmpty)
              const Center(
                child: Text("No data"),
              ),
            if (projectList.isNotEmpty)
              Column(
                children: projectList
                    .map((item) => InkWell(
                          onLongPress: () async {
                            try {
                              final res = await deleteProject(
                                idProject: item.id.toString(),
                              );
                              projectList.remove(item);

                              setState(() {});
                            } on FormatException catch (error) {
                              print("-----");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(error.message.toString())));
                            }
                          },
                          child: ListTile(
                            title: Text(item.name.toString()),
                            subtitle: Text(item.description.toString()),
                            trailing: Text(item.state.toString()),
                          ),
                        ))
                    .toList(),
              ),
            Row(
              children: [
                const Text(
                  'Tap here to add your Project Details ->',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState) {
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
                                      controller: conName,
                                      decoration: const InputDecoration(
                                        label: Text("Enter project name"),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: conDescription,
                                      maxLines: 4,
                                      decoration: const InputDecoration(
                                        label:
                                            Text("Enter project description"),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    DropdownButton<String>(
                                      value: selectedValue,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedValue = newValue ?? '';
                                        });
                                      },
                                      items: const <String>[
                                        'completed',
                                        'processing',
                                        'other'
                                      ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            child: const Text('SAVE'),
                                            onPressed: () async {
                                              final res =
                                                  await addProject(body: {
                                                "name": conName.text,
                                                "description":
                                                    conDescription.text,
                                                "state": selectedValue,
                                              });
                                              print("res body: ${res.body}");
                                              if (res.statusCode == 200) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Information Saved Successfully'),
                                                  ),
                                                );

                                                _loadProject();
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
                    ).then((value) => {
                          setState(
                            () {},
                          )
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
