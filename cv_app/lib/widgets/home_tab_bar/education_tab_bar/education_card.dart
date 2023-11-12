import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/education/education_data_model.dart';
import 'package:cv_app/widgets/home_tab_bar/education_tab_bar/educaton_row.dart';
import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    super.key, required this.education,
  });
  final EducationData education;
  @override
  Widget build(BuildContext context) {
    return  Card(
        margin: EdgeInsets.only(top: 16, bottom: 120),
        color: eggShell,
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
                info: education.university,
              ),
              Divider(
                thickness: 1,
                color: grey,
              ),
              EducationRow(
                title: 'College',
                info: education.college,
              ),
              Divider(
                thickness: 1,
                color: grey,
              ),
              EducationRow(
                title: 'Specialization',
                info: education.specialization,
              ),
              Divider(
                thickness: 1,
                color: grey,
              ),
              EducationRow(
                title: 'Level',
                info: education.level,
              ),
              Divider(
                thickness: 1,
                color: grey,
              ),
              EducationRow(
                title: 'Graduation date',
                info: education.graduationDate,
              ),
            ],
          ),
        ));
  }
}
