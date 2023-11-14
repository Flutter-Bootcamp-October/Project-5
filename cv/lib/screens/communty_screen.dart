import 'package:cv/services/user/get_all_users.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFD),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(188, 239, 214, 190),
        elevation: 0,
        title: Text(
          "Community",
          style: TextStyle(color: orange),
        ),
      ),
      body: FutureBuilder(
          future: getAllUsers(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 10, left: 10),
                child: GridView.builder(
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
                                color:
                                    const Color.fromARGB(222, 238, 214, 193)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const Text("ID: "),
                                      Text(snapshot.data![index].id.toString()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text("Name: "),
                                      Text(snapshot.data![index].name
                                          .toString()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text("Phone:"),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data![index].phone ?? "",
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text("Position title: "),
                                      Expanded(
                                        child: Text(
                                          snapshot.data![index].titlePosition ??
                                              "-",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          // style: const TextStyle(
                                          //     overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        hight14()
                      ],
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Set the number of items in each row
                    crossAxisSpacing:
                        10.0, // Set the horizontal spacing between items
                    mainAxisSpacing:
                        2.0, // Set the vertical spacing between items
                    childAspectRatio: 0.8, // Set the aspect ratio of the items
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text("error"));
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
