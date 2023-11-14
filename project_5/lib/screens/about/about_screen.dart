import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/global/globally.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final apiMethod = ApiMethods();

  @override
  void initState() {
    //get skills data, send token to edit, add and delete
    apiMethod.getAbout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          actions: [
            // add edit about api method here to edit
            Icon(
              Icons.edit,
              color: Colors.black,
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (aboutList.isEmpty) Center(child: Text("No about data added")),
            if (aboutList.isNotEmpty)
              Column(
                  // change this to listview.builder
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: aboutList
                      .map(
                        (e) => ListTile(
                          leading: Text(e.data.name),
                          subtitle: Text(
                              "email: ${e.data.email} \nphone: ${e.data.phone}\nbirthday: ${e.data.titlePosition}\nAbout me: ${e.data.about}"),
                          trailing: Text(e.data.image),
                        ),
                      )
                      .toList()),
          ],
        ));
  }
}
