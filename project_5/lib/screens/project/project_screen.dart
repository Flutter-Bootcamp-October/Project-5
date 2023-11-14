import 'package:flutter/material.dart';
import 'package:project_5/models/project_model.dart';
import 'package:project_5/screens/components/button_widget.dart';
import 'package:project_5/screens/home/home_screen.dart';

import '../components/input_text_fields.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  List<ProjectModel> projectList = [];

  @override
  Widget build(BuildContext context) {
    TextEditingController projectNameController = TextEditingController(),
        stateController = TextEditingController(),
        descriptionController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Projects",
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
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        "Add New Project",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFields(
                        title: 'Enter project name',
                        controller: projectNameController,
                        lines: 1,
                      ),
                      InputTextFields(
                        title: 'Enter project description',
                        controller: descriptionController,
                        lines: 1,
                      ),
                      InputTextFields(
                        title: 'Enter project state',
                        controller: stateController,
                        lines: 1,
                      ),
                      ButtonWidget(
                        textEntry: 'Add project',
                        onpress: () async {
                          // add project api function
                          try {
                            final element = await apimethod.addProject(body: {
                              "name": projectNameController.text,
                              "description": descriptionController.text,
                              "state": stateController.text,
                            });
                            projectList.add(element);
                            print("added to list");
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
            FutureBuilder<ProjectModel>(
              future: apimethod.getProject(),
              builder:
                  (BuildContext context, AsyncSnapshot<ProjectModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  print(snapshot.data?.data);
                  if (snapshot.data!.data.isNotEmpty) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            child: Card(
                                color: Colors.blue.shade50,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "ID: ${snapshot.data!.data[index].id}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: () async {
                                              await apimethod.removeProject(
                                                  idProject: snapshot
                                                      .data!.data[index].id
                                                      .toString());
                                              projectList.remove(snapshot
                                                  .data!.data[index].id);
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red.shade200,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "name: ${snapshot.data!.data[index].name}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "description: ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              snapshot.data!.data[index]
                                                  .description,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        });
                  } else {
                    return Center(child: Text("No Projects Added"));
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
