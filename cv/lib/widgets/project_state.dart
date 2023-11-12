import 'package:flutter/material.dart';

class ProjectState extends StatelessWidget {
  const ProjectState({super.key, required this.isComplete});
  final bool isComplete;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isComplete
              ? Colors.green.withOpacity(0.2)
              : Colors.orange.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width - 280,
      height: MediaQuery.of(context).size.height - 804,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.center,
          child: isComplete
              ? const Text(
                  "Complete",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                )
              : const Text("Processing",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange)),
        ),
      ),
    );
  }
}
