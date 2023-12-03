import 'package:cv/blocs/delete_bloc/delete_bloc.dart';
import 'package:cv/services/education/get_educations.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayAllEducation extends StatefulWidget {
  const DisplayAllEducation({super.key});

  @override
  State<DisplayAllEducation> createState() => _DisplayAllEducationState();
}

class _DisplayAllEducationState extends State<DisplayAllEducation> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getEducations(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Text(
                          "Educations:",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 8),
                        child: SizedBox(
                          height: 300,
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
                                        height: 290,
                                        width: 180,
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
                                                top: 8.0, left: 18),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "University:",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                    snapshot.data![index]
                                                            .university ??
                                                        "",
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 97, 96, 96))),
                                                hight14(),
                                                const Text("College: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text(
                                                    snapshot.data![index]
                                                            .college ??
                                                        "",
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 97, 96, 96))),
                                                hight14(),
                                                const Text("Specialization: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text(
                                                    snapshot.data![index]
                                                            .specialization ??
                                                        "",
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 97, 96, 96))),
                                                hight14(),
                                                const Text("Level: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text(
                                                    snapshot.data![index]
                                                            .level ??
                                                        "",
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 97, 96, 96))),
                                                hight14(),
                                                const Text("Graduation Date: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Text(
                                                    snapshot.data![index]
                                                            .graduationDate ??
                                                        "",
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 97, 96, 96))),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 130,
                                        child: IconButton(
                                            onPressed: () async {
                                              context.read<DeleteBloc>().add(
                                                  DeleteEducationEvent(
                                                      snapshot.data![index].id!,
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
