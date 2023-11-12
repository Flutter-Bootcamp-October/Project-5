import 'package:flutter/material.dart';
import 'package:pcv/screens/education_screen.dart';

class GetEducation extends StatefulWidget {
  const GetEducation({
    super.key,
  });

  @override
  State<GetEducation> createState() => _GetEducationState();
}

class _GetEducationState extends State<GetEducation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // if (education.isEmpty)
          //   const Center(child: CircularProgressIndicator()),
          if (education.isNotEmpty)
            Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: education
                    .map((e) => Card(
                          color: Colors.grey.shade100.withOpacity(0.3),
                          child: ListTile(
                            title: Text("${e["university"]}"),
                            subtitle: Text("${e["specialization"]}"),
                            trailing: Text(
                              "${e["level"]}",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ))
                    .toList())
        ],
      ),
    );
  }
}
