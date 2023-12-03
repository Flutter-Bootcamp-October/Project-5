import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_resume/networking/api_service.dart';

import '../../model/about_model.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({
    super.key,
  });

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final id = TextEditingController();
  final conName = TextEditingController();

  final conPosition = TextEditingController();

  final conPhone = TextEditingController();

  final conLocation = TextEditingController();

  final conBirthday = TextEditingController();

  final conAbout = TextEditingController();
  // File? selectImage;
  // String userImg = "";
  // Future<dynamic> imageUser() async {
  //   final picker = ImagePicker();
  //   final userImage = await picker.pickImage(source: ImageSource.gallery);
  //   if (userImage != null) {
  //     selectImage = File(userImage.path);

  //     setState(() {
  //       selectImage;
  //     });
  //     await userUploadImage(userImge: selectImage!);
  //   }
  //   return null;
  // }

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
        conBirthday.text = _dateFormatter.format(date);
        print(_date.toString());
        print(conBirthday.text);
      });
    }
  }

  void fetchUserAbout() async {
    About about = await userAbout();

    if (about.data != null) {
      id.text = about.data!.id.toString();
      conName.text = about.data!.name.toString();
      conPosition.text = about.data!.titlePosition.toString();
      conPhone.text = about.data!.phone.toString();
      conLocation.text = about.data!.location.toString();
      conBirthday.text = about.data!.birthday.toString();
      conAbout.text = about.data!.about.toString();
      if (about.data!.image != null) {
        // setState(() {
        //   userImg = about.data!.image!;
        // });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(' No data '),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserAbout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 95, 27, 124),
        title: const Text('Personal Information'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     imageUser();
                  //   },
                  //   onLongPress: () {
                  //     print(userImg);
                  //   },
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(12),
                  //     child: selectImage == null
                  //         ? Image.network(userImg)
                  //         : Image.file(
                  //             selectImage!,
                  //             height: 120,
                  //             fit: BoxFit.fitHeight,
                  //           ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: conName,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_sharp),
                      label: Text("Enter your name"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: conPosition,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.school),
                      label: Text("Enter title position"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: conPhone,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      label: Text("Enter contact number"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: conLocation,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      label: Text("Enter your location"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: conBirthday,
                    canRequestFocus: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.abc),
                      label: Text("Enter your birthday"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      _handleDatePicker();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLines: 4,
                    controller: conAbout,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.edit_note_sharp),
                      label: Text("Enter your about"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          // post Save
                          onPressed: () async {
                            print(conBirthday.text);
                            final res = await userEditAbout(body: {
                              "name": conName.text,
                              "title_position": conPosition.text,
                              "phone": conPhone.text,
                              "location": conLocation.text,
                              "birthday": conBirthday.text,
                              "about": conAbout.text
                            });

                            if (res.statusCode == 200) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Information Saved Successfully'),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  (await jsonDecode(res.body))["msg"]
                                      .toString(),
                                ),
                              ));
                            }
                          },
                          child: const Text('SAVE')),
                      const SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            final res =
                                await userDeleteAccount(idUser: id.text);
                            if (res.statusCode == 200 ||
                                res.statusCode == 204) {
                              setState(() {
                                fetchUserAbout();
                                conName.clear();
                                conAbout.clear();
                                conBirthday.clear();
                                conLocation.clear();
                                conPhone.clear();
                                conPosition.clear();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Information Deleted Successfully')));
                            } else {
                              try {
                                final decodedbody = await jsonDecode(res.body);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            decodedbody['msg'].toString())));
                              } catch (e) {
                                print('Error decoding response body:$e');
                              }
                            }
                          },
                          child: const Text('Delete')),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
