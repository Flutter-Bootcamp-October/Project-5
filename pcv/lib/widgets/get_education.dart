import 'package:flutter/material.dart';
import 'package:pcv/screens/education_screen.dart';
import 'package:pcv/widgets/title_widget.dart';

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
          const TitlesWidget(titles: 'Education'),
          if (education.isNotEmpty)
            GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 1,
                childAspectRatio: 5,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                shrinkWrap: true,
                children: education
                    .map((e) => Container(
                         decoration: BoxDecoration(
              color: Colors.grey.shade100.withOpacity(0.2),
              borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(15), right: Radius.circular(15))),
                          child: ListTile(
                            title: Text("${e["university"]}"),
                            subtitle: Text("${e["specialization"]}"),
                            trailing: Text(
                              "${e["level"]}",
                            ),
                          ),
                        ))
                    .toList())
        ],
      ),
    );
  }
}
