import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project5_api/servers_api/educatio/add_education_api.dart';
import 'package:flutter_project5_api/servers_api/educatio/del_education_api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_project5_api/models/education.dart';
import 'package:flutter_project5_api/widgets/custom_felid-2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final List<Data> educations = [];

  TextEditingController graduationDateController = TextEditingController();
  TextEditingController universityNameController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController levelController = TextEditingController();

  void _addEducation() async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Education Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: graduationDateController,
                readOnly: false,
                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  hintText: 'Graduation Date',
                ),
              ),
              SizedBox(height: 10.0),
              CustomTextFiield(
                hint: 'University Name',
                controller: universityNameController,
              ),
              SizedBox(height: 10.0),
              CustomTextFiield(
                hint: 'College',
                controller: collegeController,
              ),
              SizedBox(height: 10.0),
              CustomTextFiield(
                hint: 'Specialization',
                controller: specializationController,
              ),
              SizedBox(height: 10.0),
              CustomTextFiield(
                hint: 'Level',
                controller: levelController,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  await _saveEducationAPI();
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveEducation(Data education) {
    setState(() {
      educations.add(education);
    });

    graduationDateController.clear();
    universityNameController.clear();
    collegeController.clear();
    specializationController.clear();
    levelController.clear();
  }

  void _deleteEducation(int index) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await deleteeducatiion(
        token: token!,
        body: {'id': educations[index].id},
      );

      if (response.codeState == 200) {
        _removeEducation(index);
      } else {
        print("Failed to delete education. Error: ${response.msg}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  void _removeEducation(int index) {
    setState(() {
      educations.removeAt(index);
    });
  }

  Future<void> _saveEducationAPI() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await addeducatiion(
        token: token!,
        body: {
          'graduationDate': graduationDateController.text,
          'university': universityNameController.text,
          'college': collegeController.text,
          'specialization': specializationController.text,
          'level': levelController.text,
        },
      );

      if (response.codeState == 200) {
        _saveEducation(response.data![0]);
        graduationDateController.clear();
        universityNameController.clear();
        collegeController.clear();
        specializationController.clear();
        levelController.clear();
      } else {
        print("Failed to add education. Error: ${response.msg}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ))!;

    if (picked != null && picked != DateTime.now()) {
      graduationDateController.text = picked.toLocal().toString().split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Education Information',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: _addEducation,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Color.fromARGB(255, 26, 8, 90),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: educations
                      .asMap()
                      .map(
                        (index, education) => MapEntry(
                          index,
                          Card(
                            margin: EdgeInsets.only(bottom: 16.0),
                            child: ListTile(
                              title: Text(
                                  'Graduation Date: ${education.graduationDate}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'University Name: ${education.university}'),
                                  Text('College: ${education.college}'),
                                  Text(
                                      'Specialization: ${education.specialization}'),
                                  Text('Level: ${education.level}'),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => _deleteEducation(index),
                              ),
                            ),
                          ),
                        ),
                      )
                      .values
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
