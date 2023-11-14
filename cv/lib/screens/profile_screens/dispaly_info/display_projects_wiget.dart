import 'dart:convert';

import 'package:cv/services/project/delete_project.dart';
import 'package:cv/services/project/get_projects.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:flutter/material.dart';

class DisplayAllProject extends StatefulWidget {
  const DisplayAllProject({super.key});

  @override
  State<DisplayAllProject> createState() => _DisplayAllProjectState();
}

class _DisplayAllProjectState extends State<DisplayAllProject> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProjects(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          "Projects:",
                          style: TextStyle(
                              fontSize: 16,
                              color: blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: SizedBox(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Stack(
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        width: 180,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    69, 0, 0, 0)),
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            color: const Color.fromARGB(
                                                22, 0, 0, 0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "Project Name:",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  snapshot.data![index].name ??
                                                      "",
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 1,
                                                ),
                                                hight14(),
                                                const Text(
                                                    "Project Description: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text(
                                                  snapshot.data![index]
                                                          .description ??
                                                      "",
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 1,
                                                ),
                                                hight14(),
                                                const Text("Project State: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text(
                                                  snapshot.data![index].state ??
                                                      "",
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            try {
                                              final response =
                                                  await deleteProject(context, {
                                                "id_project":
                                                    snapshot.data![index].id
                                              });
                                              if (response != null &&
                                                  response.statusCode >= 200 &&
                                                  response.statusCode < 300) {
                                                setState(() {});

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            "deleted successfully")));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            jsonDecode(response!
                                                                    .body)[
                                                                "msg"])));
                                              }
                                            } catch (error) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          error.toString())));
                                            }
                                          },
                                          icon: const Icon(Icons.delete))
                                    ],
                                  ),
                                  width10()
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : const Text("");
          } else if (snapshot.hasError) {
            return const Center(child: Text("error"));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
