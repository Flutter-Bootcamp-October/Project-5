import 'package:cv_app/model/model.dart';
import 'package:cv_app/model/model.dart';
import 'package:cv_app/model/model.dart';
import 'package:cv_app/model/model.dart';
import 'package:cv_app/services/get.dart';
import 'package:flutter/material.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: Get().getusers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<Allusers> usersList = snapshot.data!;
                    return Column(
                      children: [
                        for (var element in usersList)
                          Center(
                            child: SizedBox(
                              height: 90,
                              width: 390,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.person),
                                          Text(element.name),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.phone),
                                          Row(
                                            children: [
                                              Text(element.phone),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.email),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(element.email),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  } else {
                    return Scaffold(body: CircularProgressIndicator());
                  }
                })
          ],
        ),
      ),
    );
  }
}
