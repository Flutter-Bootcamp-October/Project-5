import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/blocs/get/bloc/get_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    context.read<GetBloc>().add(GetUsersEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "All Users",
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
              if (state is GetUsersState) {
                if (state.users!.data.isEmpty) {
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
                      itemCount: state.users?.data.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 85,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Card(
                              shape: const OutlineInputBorder(),
                              color: Colors.white70,
                              child: ListTile(
                                // leading: ClipRRect(
                                //   borderRadius: BorderRadius.circular(30),
                                //   child: Image.network(
                                //     state.users!.data[index].image!,
                                //     height: 85,
                                //   ),
                                // ),
                                title: Text(
                                  "${state.users!.data[index].name}  ${state.users!.data[index].email}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
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
 * 
            FutureBuilder<UsersModel?>(
              future: getMethods.getUsersMethod(context: this.context),
              builder:
                  (BuildContext context, AsyncSnapshot<UsersModel?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  print(snapshot.data!.data);
                  if (snapshot.data!.data.isNotEmpty) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.data.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 85,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Card(
                                shape: const OutlineInputBorder(),
                                color: Colors.white70,
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(
                                      snapshot.data!.data[index].image!,
                                      height: 85,
                                    ),
                                  ),
                                  title: Text(
                                    "${snapshot.data!.data[index].name}  ${snapshot.data!.data[index].email}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
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