import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_resume/model/social_model.dart';
import 'package:project_resume/networking/api_service.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _MyWidgetState();
}

TextEditingController conUserName = TextEditingController();
List<Data> listSocial = [];
String selectedValue = 'instagram';

class _MyWidgetState extends State<SocialScreen> {
  _loadSocial() async {
    try {
      final Social res = await getSocial();
      listSocial = res.data!;
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
    _loadSocial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Social'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (listSocial.isEmpty)
              const Center(
                child: Text("No data"),
              ),
            if (listSocial.isNotEmpty)
              Column(
                children: listSocial
                    .map((item) => InkWell(
                          onLongPress: () async {
                            try {
                              final res = await deleteSocial(
                                idSocial: item.id.toString(),
                              );
                              listSocial.remove(item);

                              setState(() {});
                            } on FormatException catch (error) {
                              print("-----");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(error.message.toString())));
                            }
                          },
                          child: ListTile(
                            title: Text(item.username.toString()),
                            leading: Text(item.social.toString()),
                          ),
                        ))
                    .toList(),
              ),
            Row(
              children: [
                const Text(
                  'Tap here to add your Social ->',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    Future.delayed(
                        const Duration(seconds: 1),
                        () => showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          TextField(
                                            controller: conUserName,
                                            decoration: const InputDecoration(
                                              label:
                                                  Text("Enter your UserName"),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15))),
                                            ),
                                          ),
                                          DropdownButton<String>(
                                            value: selectedValue,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedValue = newValue ?? '';
                                              });
                                            },
                                            items: const <String>[
                                              'instagram',
                                              'facebook',
                                              'youtube',
                                              'whatsapp',
                                              'tiktok',
                                              'telegram',
                                              'snapchat',
                                              'other',
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
                                                        await addSocial(body: {
                                                      'username':
                                                          conUserName.text,
                                                      "social": selectedValue,
                                                    });
                                                    print(
                                                        "res body: ${res.body}");
                                                    if (res.statusCode == 200) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                              'Information Saved Successfully'),
                                                        ),
                                                      );

                                                      _loadSocial();
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                              (await jsonDecode(
                                                                          res.body))[
                                                                      "msg"]
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
                                  );
                                });
                              },
                            ).then((value) => {
                                  // setState(
                                  //   () {},
                                  // )
                                }));
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
