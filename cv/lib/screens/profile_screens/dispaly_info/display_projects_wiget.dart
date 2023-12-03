import 'package:cv/blocs/delete_bloc/delete_bloc.dart';
import 'package:cv/models/project.dart';
import 'package:cv/services/project/get_projects.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayAllProject extends StatelessWidget {
  const DisplayAllProject({super.key, projects});

  @override
  Widget build(BuildContext context) {
    List<Project>? projects = [];
    return FutureBuilder(
        future: getProjects(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Text(
                          "Projects:",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 190,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              // if (projects!.isEmpty) {
                              projects = snapshot.data!;
                              // }
                              return Row(
                                children: [
                                  Stack(
                                    children: [
                                      SizedBox(
                                        height: 180,
                                        width: 180,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: lightBlue,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Project Name:",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                      projects![index].name ??
                                                          "",
                                                      overflow:
                                                          TextOverflow.clip,
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              97,
                                                              96,
                                                              96))),
                                                  hight14(),
                                                  const Text(
                                                      "Project Description: ",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                                  Text(
                                                      projects![index]
                                                              .description ??
                                                          "",
                                                      overflow:
                                                          TextOverflow.clip,
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              97,
                                                              96,
                                                              96))),
                                                  hight14(),
                                                  const Text("Project State: ",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                                  Text(
                                                    projects![index].state ??
                                                        "",
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 97, 96, 96)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 125,
                                        top: 3,
                                        child: IconButton(
                                            onPressed: () async {
                                              context.read<DeleteBloc>().add(
                                                  DeleteProjectEvent(
                                                      projects![index].id!,
                                                      context));
                                            },
                                            icon: const Icon(
                                              Icons.cancel_sharp,
                                              // color: pink,
                                              size: 20,
                                            )),
                                      )
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
