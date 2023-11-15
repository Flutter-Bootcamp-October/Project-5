import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/all_users/all_users_model.dart';
import 'package:cv_app/models/globals.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: richBlack,
        centerTitle: true,
        title: Text('All Users'),
      ),
      backgroundColor: richBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder<AllUsersModel?>(
            future: network.getAllUsersMethod(context: context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                final users = snapshot.data!.data;
                if (users.isEmpty) {
                  return Text('');
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: silverBlue,
                        ),
                        height: 50,
                        child: Row(
                          children: [
                            width10,
                            CircleAvatar(
                              backgroundImage: NetworkImage(user.image!),
                            ),
                            width12,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                height8,
                                Text(
                                  user.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  user.titlePosition!,
                                  style: TextStyle(
                                    color: eggShell,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return height20;
                    },
                  );
                }
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
