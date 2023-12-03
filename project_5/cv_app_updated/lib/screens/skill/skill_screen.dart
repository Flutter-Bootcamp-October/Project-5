import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/blocs/delete/bloc/delete_bloc.dart';
import 'package:project_5/blocs/get/bloc/get_bloc.dart';
import 'package:project_5/screens/skill/add_skill_screen.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  @override
  void initState() {
    context.read<GetBloc>().add(GetSkillEvent(context: context));
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
                        builder: (contxet) => const AddSkillScreen()));
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
          "Skills",
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
              if (state is GetSkillState) {
                if (state.skill!.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      "No Skills Added",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  );
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.skill!.data!.length,
                      itemBuilder: ((context, index) {
                        return SizedBox(
                          // width: 25,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Card(
                              color: Colors.white.withOpacity(0.7),
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              clipBehavior: Clip.antiAlias,
                              child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        state.skill!.data![index].skill,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          context.read<DeleteBloc>().add(
                                              DeleteSkillEvent(
                                                  id: state
                                                      .skill!.data![index].id
                                                      .toString()));
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red.shade200,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        );
                      }));
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
                                await addMethods.addSkillMethod(body: {
                              "skill": skillController.text,
                            }, context: this.context);
                            skillList.add(element);
                            Navigator.pop(context);
                            setState(() {});
                          } on FormatException catch (error) {
                            print("error");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(error.message.toString())));
                          }
 */



/**
 * FutureBuilder<SkillModel?>(
              future: getMethods.getSkillsMethod(context: this.context),
              builder:
                  (BuildContext context, AsyncSnapshot<SkillModel?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  print(snapshot.data?.data);
                  if (snapshot.data!.data!.isNotEmpty) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Card(
                              color: Colors.blue.shade50,
                              child: ListTile(
                                  leading: Text(
                                    "ID: ${snapshot.data!.data![index].id}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  title: Text(
                                    "${snapshot.data!.data![index].skill}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () async {
                                      context.read<DeleteBloc>().add(
                                          DeleteSkillEvent(
                                              id: snapshot.data!.data![index].id
                                                  .toString()));
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red.shade200,
                                    ),
                                  )),
                            ),
                          );
                        });
                  } else {
                    return const Center(child: Text("No Skills added"));
                  }
                }
              },
            ),
 */