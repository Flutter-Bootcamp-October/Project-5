import 'package:cv/services/user/get_all_users.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getAllUsers(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 180,
                        width: 180,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25),
                            color: lightBlue,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(snapshot.data![index].id.toString()),
                              Text(snapshot.data![index].name.toString()),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data![index].phone ?? "",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data![index].titlePosition ?? "",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      hight14()
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text("error"));
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
