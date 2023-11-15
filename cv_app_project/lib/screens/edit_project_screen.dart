import 'package:cv_app_project/components/appBar/appBar.dart';
import 'package:cv_app_project/screens/add_project.dart';
import 'package:cv_app_project/services/project_api.dart';
import 'package:flutter/material.dart';

class EditProjectScreen extends StatelessWidget {
  const EditProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        'Projects',
        () {
          Navigator.pop(context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0C356A),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProject(),
              ));
        },
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getProject(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error');
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          color: Color(0xffFFC436),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(width: double.infinity),
                                ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.data!.length,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      padding: EdgeInsets.all(10),
                                      color: Color(0xff0174BE),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!.data![i].name
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            snapshot.data!.data![i].description
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            snapshot.data!.data![i].state
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 16);
                                  },
                                ),
                                SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
