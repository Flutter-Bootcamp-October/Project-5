import 'package:cv/constants/sizes.dart';
import 'package:cv/widgets/education_details.dart';
import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  const EducationCard(
      {super.key, required this.specialization, required this.universtyName});
  final String specialization;
  final String universtyName;

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
                        specialization,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Color(0xffFF7779),
                          ))
                    ],
                  ),
                  Text(
                    universtyName,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  height12,
                  const EducationDetail(
                    icon: Icons.location_city_outlined,
                    title: "college",
                  ),
                  height12,
                  const EducationDetail(
                    icon: Icons.grade_outlined,
                    title: "level",
                  ),
                  height12,
                  const EducationDetail(
                    icon: Icons.date_range,
                    title: "graduation date",
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
