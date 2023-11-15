import 'package:flutter/material.dart';
import 'package:project_5/global/globally.dart';
import 'package:project_5/models/social_model.dart';
import 'package:project_5/screens/components/button_widget.dart';
import 'package:project_5/screens/components/input_text_fields.dart';
import 'package:project_5/screens/home/home_screen.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  TextEditingController accountusernameController = TextEditingController(),
      socialController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(206, 13, 72, 161),
        child: Icon(Icons.add),
        onPressed: () {
          // show model bottom sheet to add new account
          showModalBottomSheet(
            context: context,
            builder: (context) => Builder(builder: (context) {
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 75, bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        "Add Social account",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFields(
                        title: 'Enter username',
                        controller: accountusernameController,
                        lines: 1,
                      ),
                      InputTextFields(
                        title: 'Enter social media app name',
                        controller: socialController,
                        lines: 1,
                      ),
                      ButtonWidget(
                        textEntry: 'Add account',
                        onpress: () async {
                          // add skill api function
                          try {
                            final element = await apimethod.addSocial(body: {
                              "username": accountusernameController.text,
                              "social": socialController.text,
                            });
                            socialList.add(element);
                            Navigator.pop(context);
                            setState(() {});
                          } on FormatException catch (error) {
                            print("error");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(error.message.toString())));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
          ).then((value) => Future.delayed(const Duration(seconds: 1)));
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<SocialModel>(
              future: apimethod.getSocial(),
              builder:
                  (BuildContext context, AsyncSnapshot<SocialModel> snapshot) {
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
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: InkWell(
                                  onTap: () async {
                                    await apimethod.removeSocial(
                                        idAccount: snapshot
                                            .data!.data![index].id
                                            .toString());
                                    skillList
                                        .remove(snapshot.data!.data![index].id);
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red.shade200,
                                  ),
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
