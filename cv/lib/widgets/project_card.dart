import 'package:cv/constants/sizes.dart';
import 'package:cv/widgets/project_state.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard(
      {super.key,
      required this.projectName,
      required this.projectDescription,
      required this.isComplete});
  final String projectName;
  final String projectDescription;
  final bool isComplete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        height: MediaQuery.of(context).size.height - 630,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        projectName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            //delete
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Color(0xffFF7779),
                          ))
                    ],
                  ),
                  Text(
                    projectDescription,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  height32,
                  ProjectState(
                    isComplete: isComplete,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
