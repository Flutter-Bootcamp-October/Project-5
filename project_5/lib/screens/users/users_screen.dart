import 'package:flutter/material.dart';
import 'package:project_5/models/user_model.dart';
import 'package:project_5/screens/home/home_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
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
            FutureBuilder<Users>(
              future: apimethod.getUsers(),
              builder: (BuildContext context, AsyncSnapshot<Users> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  print(snapshot.data!.data);
                  if (snapshot.data!.data.isNotEmpty) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.data.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Card(
                              color: Colors.blue.shade50,
                              child: ListTile(
                                leading: Text(
                                  "${snapshot.data!.data[index].name}  ${snapshot.data!.data[index].email}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(
                        child: Text("No social media accounts added"));
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
