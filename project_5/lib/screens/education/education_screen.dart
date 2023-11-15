import 'package:flutter/material.dart';
import 'package:project_5/models/education_model.dart';
import 'package:project_5/screens/components/button_widget.dart';
import 'package:project_5/screens/components/input_text_fields.dart';
import 'package:project_5/screens/home/home_screen.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

List<EducationModel> educationList = [];

class _EducationScreenState extends State<EducationScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController graduationController = TextEditingController(),
        universityController = TextEditingController(),
        collegeController = TextEditingController(),
        specializationController = TextEditingController(),
        levelController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Education",
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
            FutureBuilder<EducationModel>(
              future: apimethod.getEducation(),
              builder: (BuildContext context,
                  AsyncSnapshot<EducationModel> snapshot) {
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            child: Card(
                                color: Colors.blue.shade50,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "ID: ${snapshot.data!.data?[index].id}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: () async {
                                              await apimethod.removeProject(
                                                  idProject: snapshot
                                                      .data!.data![index].id
                                                      .toString());
                                              educationList.remove(snapshot
                                                  .data!.data![index].id);
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red.shade200,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "name: ${snapshot.data!.data?[index].graduationDate}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "name: ${snapshot.data!.data?[index].specialization}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "name: ${snapshot.data!.data?[index].level}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "name: ${snapshot.data!.data?[index].university}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "description: ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              snapshot
                                                  .data!.data![index].college,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        });
                  } else {
                    return Center(child: Text("No Education Added"));
                  }
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(206, 13, 72, 161),
        child: Icon(Icons.add),
        onPressed: () {
          // show model bottom sheet to add new skils
          showModalBottomSheet(
            context: context,
            builder: (context) => Builder(builder: (context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        "Add New Education",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFields(
                        title: 'Enter university name',
                        controller: universityController,
                        lines: 1,
                      ),
                      InputTextFields(
                        title: 'Enter college name',
                        controller: collegeController,
                        lines: 1,
                      ),
                      InputTextFields(
                        title: 'Enter specialization',
                        controller: specializationController,
                        lines: 1,
                      ),
                      InputTextFields(
                        title: 'Enter level',
                        controller: levelController,
                        lines: 1,
                      ),
                      InputTextFields(
                        title: 'Enter graduation date',
                        controller: graduationController,
                        lines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ButtonWidget(
                        textEntry: 'Add Education',
                        onpress: () async {
                          // add project api function
                          try {
                            final element = await apimethod.addEducation(body: {
                              "university": universityController.text,
                              "college": collegeController.text,
                              "specialization": specializationController.text,
                              "level": levelController,
                              "graduation_date": graduationController,
                            });
                            educationList.add(element);
                            print("education added to list");
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
    );
  }
}
