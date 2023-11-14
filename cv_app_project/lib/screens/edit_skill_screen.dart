import 'package:cv_app_project/components/appBar/appBar.dart';
import 'package:cv_app_project/screens/add_skill.dart';
import 'package:cv_app_project/services/skill_api.dart';
import 'package:flutter/material.dart';

class EditSkillScreen extends StatelessWidget {
  const EditSkillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Skills', () {
        Navigator.pop(context);
      }),
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
                builder: (context) => AddSkill(),
              ));
        },
      ),
      body: FutureBuilder(
        future: getskill(),
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
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Card(
                    color: Color(0xffFFC436),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, i) {
                          return Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              Container(width: double.infinity),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xff0174BE),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  snapshot.data!.data![i].skill.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
