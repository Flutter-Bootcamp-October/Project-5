// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/blocs/delete/bloc/delete_bloc.dart';
import 'package:project_5/blocs/get/bloc/get_bloc.dart';
import 'package:project_5/screens/project/add_project_screen.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  void initState() {
    context.read<GetBloc>().add(GetProjectEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contxet) => const AddProjectScreen()));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              )),
          const SizedBox(
            width: 8,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<GetBloc, GetState>(builder: (context, state) {
              if (state is GetProjectState) {
                if (state.project!.data.isEmpty) {
                  return const Center(
                    child: Text(
                      "No Projects Added",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  );
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.project?.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 5),
                          child: Card(
                              color: Colors.blue.shade50,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "ID: ${state.project!.data[index].id}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () async {
                                            context.read<DeleteBloc>().add(
                                                DeleteProjectEvent(
                                                    id: state
                                                        .project!.data[index].id
                                                        .toString()));
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red.shade200,
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "name: ${state.project!.data[index].name}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Row(
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
                                            state.project!.data[index]
                                                .description,
                                            style: const TextStyle(
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
                }
              } else if (state is GetLoadState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetErrorState) {
                return Center(
                  child: Text(state.message),
                );
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }
}

/**
 * try {
                            final element =
                                await addMethods.addProjectMethod(body: {
                              "name": projectNameController.text,
                              "description": descriptionController.text,
                              "state": stateController.text,
                            }, context: this.context);
                            projectList.add(element);
                            print("added to list");
                            Navigator.pop(context);
                            setState(() {});
                          } on FormatException catch (error) {
                            print("error");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(error.message.toString())));
                          }
 */

/**
 * FutureBuilder<ProjectModel?>(
              future: getMethods.getProjectMethod(context: this.context),
              builder: (BuildContext context,
                  AsyncSnapshot<ProjectModel?> snapshot) {
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
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () async {
                                              context.read<DeleteBloc>().add(
                                                  DeleteProjectEvent(
                                                      id: snapshot
                                                          .data!.data[index].id
                                                          .toString()));
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red.shade200,
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "name: ${snapshot.data!.data[index].name}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Row(
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
                                              style: const TextStyle(
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
                    return const Center(child: Text("No Projects Added"));
                  }
                }
              },
            ),
 */
