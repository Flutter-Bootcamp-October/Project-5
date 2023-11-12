import 'package:flutter/material.dart';
import 'package:pcv/screens/project_screen.dart';

class GetProjectWidget extends StatefulWidget {
  const GetProjectWidget({super.key});

  @override
  State<GetProjectWidget> createState() => _GetProjectWidgetState();
}

class _GetProjectWidgetState extends State<GetProjectWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (projects.isNotEmpty) const Text('project'),
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: projects
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100.withOpacity(0.5),
                        ),
                        child: ListTile(
                          title: Text("${e["name"]}"),
                          subtitle: Text(
                            "${e["description"]}",
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: Text(
                            "${e["state"]}",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ))
                .toList())
      ],
    );
  }
}
