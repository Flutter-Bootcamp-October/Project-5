import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/education/education_data_model.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/widgets/home_tab_bar/education_tab_bar/educaton_row.dart';
import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    super.key,
    required this.education,
  });
  final EducationData education;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () async {
        final result = await network
            .deleteEducationMethod(body: {'id_education': education.id});
      },
      child: Card(
          margin: const EdgeInsets.only(top: 16, bottom: 10),
          color: eggShell,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
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
                const Divider(
                  thickness: 1,
                  color: grey,
                ),
                EducationRow(
                  title: 'College',
                  info: education.college,
                ),
                const Divider(
                  thickness: 1,
                  color: grey,
                ),
                EducationRow(
                  title: 'Specialization',
                  info: education.specialization,
                ),
                const Divider(
                  thickness: 1,
                  color: grey,
                ),
                EducationRow(
                  title: 'Level',
                  info: education.level,
                ),
                const Divider(
                  thickness: 1,
                  color: grey,
                ),
                EducationRow(
                  title: 'Graduation date',
                  info: education.graduationDate,
                ),
              ],
            ),
          )),
    );
  }
}
