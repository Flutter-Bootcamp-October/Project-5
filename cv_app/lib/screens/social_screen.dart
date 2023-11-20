import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/screens/add_social.dart';
import 'package:cv_app/services/social.dart';
import 'package:cv_app/widgets/title_row.dart';
import 'package:flutter/material.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("Social"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TitleRow(
              title: "My Socials",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddSocial())).then((value) {
                  setState(() {});
                });
              },
            ),
            FutureBuilder(
              future: showSocial(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: mainColor,
                        child: ListTile(
                          leading: const Icon(
                              Icons.connect_without_contact_rounded,
                              color: Colors.white,
                              size: 30),
                          title: Text(
                              "Social: ${snapshot.data![index].social} \n@${snapshot.data![index].username}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text('Delete Social'),
                                        content: const Text(
                                            'Sure you want to delete this Social?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              deleteSocial(snapshot
                                                  .data![index].id
                                                  .toString());
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 900), () {
                                                setState(() {});
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            child: const Text(
                                              'Delete',
                                              style: TextStyle(
                                                  color: Colors.redAccent),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Close'),
                                          ),
                                        ],
                                      ));
                            },
                            icon: const Icon(
                              Icons.delete_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: mainColor),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
