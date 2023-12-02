import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/screens/add_education.dart';
import 'package:cv_app/services/education.dart';
import 'package:cv_app/widgets/title_row.dart';
import 'package:flutter/material.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("Education"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TitleRow(
              title: "My education",
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddEducationScreen()))
                    .then((value) {
                  setState(() {});
                });
              },
            ),
            FutureBuilder(
              future: showEducation(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: mainColor,
                        child: ListTile(
                          leading: const Icon(Icons.school_rounded,
                              color: Colors.white, size: 30),
                          title: Text(
                              "Univercity: ${snapshot.data![index].university}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data![index].college}, ${snapshot.data![index].specialization} ",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Graduation Date: ${snapshot.data![index].graduationDate}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Delete Education'),
                                  content: const Text(
                                      'Sure you want to delete this univercity?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        deleteEducation(snapshot.data![index].id
                                            .toString());
                                        Future.delayed(
                                            const Duration(milliseconds: 900),
                                            () {
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      child: const Text(
                                        'Delete',
                                        style:
                                            TextStyle(color: Colors.redAccent),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                ),
                              );
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
