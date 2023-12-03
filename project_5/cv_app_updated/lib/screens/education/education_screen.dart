import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/blocs/delete/bloc/delete_bloc.dart';
import 'package:project_5/blocs/get/bloc/get_bloc.dart';
import 'package:project_5/screens/education/add_education_screen.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  void initState() {
    context.read<GetBloc>().add(GetEducationEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contxet) => const AddEducationScreen()));
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
            "Education",
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
                if (state is GetEducationState) {
                  if (state.education!.data!.isEmpty) {
                    return const Center(
                      child: Text("No Education Added"),
                    );
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.education!.data?.length ?? 0,
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
                                            "ID: ${state.education!.data?[index].id}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () async {
                                              context.read<DeleteBloc>().add(
                                                  DeleteEducationEvent(
                                                      id: state.education!
                                                          .data![index].id
                                                          .toString()));
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red.shade200,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Graduation Date: ${state.education!.data?[index].graduationDate}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Specialization: ${state.education!.data?[index].specialization}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Level: ${state.education!.data?[index].level}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "University: ${state.education!.data?[index].university}",
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
                                              state.education!.data![index]
                                                  .college,
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
                } else {
                  return Container();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * await deleteMethods
                                                        .removeEducation(
                                                            idEducation: snapshot
                                                                .data!
                                                                .data![index]
                                                                .id
                                                                .toString());
                                                    educationList.remove(
                                                        snapshot.data!
                                                            .data![index].id);
                                                    setState(() {});
 */

/**
 * try {
                              final element =
                                  await addMethods.addEducationMethod(body: {
                                "university": universityController.text,
                                "college": collegeController.text,
                                "specialization": specializationController.text,
                                "level": levelController.text,
                                "graduation_date": graduationController.text,
                              }, context: this.context);
                              educationList.add(element);
                              print("education added to list");
                              Navigator.pop(context);
                              setState(() {});
                            } on FormatException catch (error) {
                              print("error");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(error.message.toString())));
                            }
 */


/**
 * 
              FutureBuilder<EducationModel?>(
                future: getMethods.getEducationMethod(context: this.context),
                builder: (BuildContext context,
                    AsyncSnapshot<EducationModel?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    print(snapshot.data?.data);
                    if (snapshot.data!.data!.isNotEmpty) {
                      /// add bloc builder on the list view
                      ///
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.data?.length ?? 0,
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
                                              "ID: ${snapshot.data!.data?[index].id}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () async {
                                                context.read<DeleteBloc>().add(
                                                    DeleteEducationEvent(
                                                        id: snapshot.data!
                                                            .data![index].id
                                                            .toString()));
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red.shade200,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Graduation Date: ${snapshot.data!.data?[index].graduationDate}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Specialization: ${snapshot.data!.data?[index].specialization}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Level: ${snapshot.data!.data?[index].level}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "University: ${snapshot.data!.data?[index].university}",
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
                                                snapshot
                                                    .data!.data![index].college,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                      return const Center(child: Text("No Education Added"));
                    }
                  }
                },
              ),
 */