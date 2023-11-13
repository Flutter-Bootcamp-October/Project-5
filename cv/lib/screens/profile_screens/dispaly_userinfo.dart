import 'package:cv/screens/profile_screens/edit_user.dart';
import 'package:cv/services/user/about.dart';
import 'package:cv/style/sizes.dart';
import 'package:flutter/material.dart';

class DisplayUserInfo extends StatefulWidget {
  const DisplayUserInfo({super.key});

  @override
  State<DisplayUserInfo> createState() => _DisplayUserInfoState();
}

class _DisplayUserInfoState extends State<DisplayUserInfo> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: aboutAPI(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.89,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(69, 0, 0, 0)),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(35),
                        color: const Color.fromARGB(22, 0, 0, 0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                // uploadImage();
                              },
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: snapshot.data!.image != null
                                    ? Image.network(snapshot.data!.image!)
                                    : Image.asset("assets/219986.png"),
                              ),
                            ),
                            const Text(
                              "Name:",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              snapshot.data!.name ?? "",
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                            hight14(),
                            const Text("Phone: ",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              snapshot.data!.phone ?? "",
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                            hight14(),
                            const Text("Email: ",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              snapshot.data!.email ?? "",
                            ),
                            hight14(),
                            const Text("Title Position: ",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              snapshot.data!.titlePosition ?? "",
                            ),
                            hight14(),
                            const Text("Location: ",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              snapshot.data!.location ?? "",
                            ),
                            hight14(),
                            const Text("Birthday: ",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              snapshot.data!.birthday ?? "",
                            ),
                            hight14(),
                            const Text("About: ",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              snapshot.data!.about ?? "",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        left: 300,
                        top: 20,
                        child: InkWell(
                            onTap: () async {
                              final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditUserScreen(
                                            user: snapshot.data!,
                                          )));
                              if (result != null && result == true) {
                                setState(() {});
                              }
                            },
                            child: const Icon(Icons.edit)))
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("error"));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
