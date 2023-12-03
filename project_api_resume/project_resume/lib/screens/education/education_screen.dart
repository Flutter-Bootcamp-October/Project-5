import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_resume/model/education_model.dart';
import 'package:project_resume/networking/api_service.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _MyWidgetState();
}

TextEditingController conCollege = TextEditingController();
TextEditingController conSpecialization = TextEditingController();
TextEditingController conUniversity = TextEditingController();
TextEditingController conGraduationDate = TextEditingController();
List<Data> educationList = [];
String selectedValue = 'Bachelors';

class _MyWidgetState extends State<EducationScreen> {
  _loadEducation() async {
    try {
      final Education res = await getEducation();
      educationList = res.data!;
      setState(() {});
    } on FormatException catch (error) {
      print("-----");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message.toString())));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadEducation();
  }

  final DateFormat _dateFormatter = DateFormat('yyyy/MM/dd');
  DateTime _date = DateTime.now();
  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (date != null && date != _date) {
      setState(() {
        _date = date;
        conGraduationDate.text = _dateFormatter.format(date);
        print(_date.toString());
        print(conGraduationDate.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 56, 173, 182),
        title: const Text('Education'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (educationList.isEmpty)
              const Center(
                child: Text("No data"),
              ),
            if (educationList.isNotEmpty)
              Column(
                children: educationList
                    .map((item) => InkWell(
                          onLongPress: () async {
                            try {
                              final res = await deleteEducation(
                                idEducation: item.id.toString(),
                              );
                              educationList.remove(item);

                              setState(() {});
                            } on FormatException catch (error) {
                              print("-----");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(error.message.toString())));
                            }
                          },
                          child: ListTile(
                            title:
                                Center(child: Text(item.university.toString())),
                            subtitle: Column(
                              children: [
                                Text(item.specialization.toString()),
                                Text(item.college.toString()),
                                Text(item.graduationDate.toString()),
                              ],
                            ),
                            trailing: Text(item.level.toString()),
                          ),
                        ))
                    .toList(),
              ),
            Row(
              children: [
                const Text(
                  'Tap here to add your Education Details ->',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return SizedBox(
                            height: 600,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(13),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    TextField(
                                      controller: conUniversity,
                                      decoration: const InputDecoration(
                                        label: Text("Enter University name"),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: conSpecialization,
                                      decoration: const InputDecoration(
                                        label:
                                            Text("Enter Specialization name "),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: conCollege,
                                      decoration: const InputDecoration(
                                        label: Text("Enter College name "),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: conGraduationDate,
                                      decoration: const InputDecoration(
                                        label: Text("Enter Graduation Date "),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    DropdownButton<String>(
                                      value: selectedValue,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedValue = newValue ?? '';
                                        });
                                      },
                                      items: const <String>[
                                        'school',
                                        'diploma',
                                        'Master',
                                        'ph.D',
                                        'Bachelors',
                                        'other'
                                      ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            child: const Text('SAVE'),
                                            onPressed: () async {
                                              final res =
                                                  await addEducation(body: {
                                                "graduation_date":
                                                    conGraduationDate.text,
                                                "university":
                                                    conUniversity.text,
                                                "college": conCollege.text,
                                                "specialization":
                                                    conSpecialization.text,
                                                "level": selectedValue,
                                              });
                                              print("res body: ${res.body}");
                                              if (res.statusCode == 200) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Information Saved Successfully'),
                                                  ),
                                                );

                                                _loadEducation();
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        (await jsonDecode(res
                                                                .body))["msg"]
                                                            .toString()),
                                                  ),
                                                );
                                              }
                                              Navigator.of(context).pop();
                                            }),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        ElevatedButton(
                                          child: const Text('CANCEL'),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                      },
                    ).then((value) => {
                          setState(
                            () {},
                          )
                        });
                  },
                  child: const Icon(
                    Icons.add,
                    size: 40,
                    color: Color.fromARGB(255, 25, 128, 28),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
