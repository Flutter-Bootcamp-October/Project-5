import 'package:flutter/material.dart';
import 'package:pcv/screens/project_screen.dart';
import 'package:pcv/widgets/title_widget.dart';

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
        if (projects.isNotEmpty)
          const TitlesWidget(
            titles: 'Project',
          ),
        GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            shrinkWrap: true,
            children: projects
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100.withOpacity(0.2),
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(15),
                                right: Radius.circular(15))),
                        child: Column(children: [
                          Text(
                            "${e["name"]}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${e["state"]}",
                          ),
                        ]),
                      ),
                    ))
                .toList())
      ],
    );
  }
}
