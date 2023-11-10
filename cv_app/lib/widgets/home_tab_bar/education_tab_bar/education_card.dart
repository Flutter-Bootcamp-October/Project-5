import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/widgets/home_tab_bar/education_tab_bar/educaton_row.dart';
import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
        margin: EdgeInsets.only(top: 16, bottom: 200),
        color: lightEggShell,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Education',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: richBlack,
                ),
              ),
              height15,
              EducationRow(
                title: 'University',
                info: 'university name',
              ),
              Divider(
                thickness: 1,
                color: grey,
              ),
              EducationRow(
                title: 'College',
                info: 'college name',
              ),
              Divider(
                thickness: 1,
                color: grey,
              ),
              EducationRow(
                title: 'Specialization',
                info: 'specialization name',
              ),
              Divider(
                thickness: 1,
                color: grey,
              ),
              EducationRow(
                title: 'Level',
                info: 'level number',
              ),
              Divider(
                thickness: 1,
                color: grey,
              ),
              EducationRow(
                title: 'Graduation date',
                info: 'specialization name',
              ),
            ],
          ),
        ));
  }
}
