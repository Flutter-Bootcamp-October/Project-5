import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/screens/add_project_screen.dart';
import 'package:cv_app/services/project.dart';
import 'package:cv_app/widgets/title_row.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("Projects"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TitleRow(
              title: "My Projects",
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddProject()))
                    .then((value) {
                  setState(() {});
                });
              },
            ),
            FutureBuilder(
              future: showProjects(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: mainColor,
                        child: ListTile(
                          leading: const Icon(Icons.work_rounded,
                              color: Colors.white, size: 30),
                          title: Text("Project: ${snapshot.data![index].name}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description: ${snapshot.data![index].description}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "State: ${snapshot.data![index].state}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text('Delete project'),
                                        content: const Text(
                                            'Sure you want to delete this project?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              deleteProject(snapshot
                                                  .data![index].id
                                                  .toString());
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 900), () {
                                                setState(() {});
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            child: const Text(
                                              'Delete',
                                              style: TextStyle(
                                                  color: Colors.redAccent),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Close'),
                                          ),
                                        ],
                                      ));
                            },
                            icon: const Icon(
                              Icons.delete_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: mainColor),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
