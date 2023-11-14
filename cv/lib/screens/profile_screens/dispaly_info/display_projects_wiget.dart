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
                              // if (snapshot.data![index].state == "completed") {
                              //   borderColor = const Color(0xff1C7C54);
                              // }
                              // if (snapshot.data![index].state == "processing") {
                              //   borderColor = const Color(0xffFEC086);
                              // }
                              // if (snapshot.data![index].state == "other") {
                              //   borderColor = const Color(0xffCC444B);
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
                                              // gradient: const RadialGradient(
                                              //   center: Alignment.center,
                                              //   radius: 0.5,
                                              //   colors: [
                                              //     Color.fromARGB(
                                              //         164, 107, 128, 131),
                                              //     Color(0xffE3F0F3),
                                              //   ],
                                              // ),

                                              // border: Border.all(
                                              //     color: borderColor),
                                              // boxShadow: [
                                              //   BoxShadow(
                                              //     color: lightBlue.withOpacity(
                                              //         0.5), // Shadow color
                                              //     spreadRadius:
                                              //         2, // Spread radius
                                              //     blurRadius: 2, // Blur radius
                                              //     offset: const Offset(0,
                                              //         2), // Changes position of shadow
                                              //   ),
                                              // ],
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
                                                      snapshot.data![index]
                                                              .name ??
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
                                                      snapshot.data![index]
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
                                                    snapshot.data![index]
                                                            .state ??
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
                                              try {
                                                final response =
                                                    await deleteProject(
                                                        context, {
                                                  "id_project":
                                                      snapshot.data![index].id
                                                });
                                                if (response != null &&
                                                    response.statusCode >=
                                                        200 &&
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
                                                              jsonDecode(
                                                                      response!
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
