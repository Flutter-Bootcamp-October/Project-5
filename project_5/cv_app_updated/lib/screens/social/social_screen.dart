// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/blocs/delete/bloc/delete_bloc.dart';
import 'package:project_5/blocs/get/bloc/get_bloc.dart';
import 'package:project_5/screens/social/add_social_screen.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  @override
  void initState() {
    context.read<GetBloc>().add(GetSocialEvent(context: context));
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
                        builder: (contxet) => const AddSocialScreen()));
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
          "Social Accounts",
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
              if (state is GetSocialState) {
                if (state.social!.data!.isEmpty) {
                  return const Center(
                    child: Text("No Social Accounts Added"),
                  );
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.social!.data!.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Card(
                            color: Colors.blue.shade50,
                            child: ListTile(
                                leading: Text(
                                  "${state.social?.data![index].username}  ${state.social?.data![index].social}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: IconButton(
                                  onPressed: () async {
                                    context.read<DeleteBloc>().add(
                                        DeleteSocialEvent(
                                            id: state.social!.data![index].id
                                                .toString()));
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red.shade200,
                                  ),
                                )),
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
              } else {
                return Container();
              }
            })
          ],
        ),
      ),
    );
  }
}


/**
 *  try {
                            final element =
                                await addMethods.addSocialMethod(body: {
                              "username": accountusernameController.text,
                              "social": socialController.text,
                            }, context: this.context);
                            socialList.add(element);
                            Navigator.pop(context);
                            setState(() {});
                          } on FormatException catch (error) {
                            print("error");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(error.message.toString())));
                          }
 */




/**
 * 
 * FutureBuilder<SocialModel?>(
              future: getMethods.getSocialMethod(context: this.context),
              builder:
                  (BuildContext context, AsyncSnapshot<SocialModel?> snapshot) {
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
                                    "${snapshot.data!.data![index].username}  ${snapshot.data!.data![index].social}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () async {
                                      context.read<DeleteBloc>().add(
                                          DeleteSocialEvent(
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
                    return const Center(
                        child: Text("No social media accounts added"));
                  }
                }
              },
            ),
 */