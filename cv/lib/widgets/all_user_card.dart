import 'package:cv/constants/sizes.dart';
import 'package:cv/widgets/education_details.dart';
import 'package:flutter/material.dart';

class AllUserCard extends StatelessWidget {
  const AllUserCard({super.key});

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
            child: const Padding(
              padding: EdgeInsets.only(left: 16, top: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "position title",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  height12,
                  EducationDetail(
                    icon: Icons.phone_android_outlined,
                    title: "phone",
                  ),
                  height12,
                  EducationDetail(
                    icon: Icons.email_outlined,
                    title: "email",
                  ),
                  height12,
                  EducationDetail(
                    icon: Icons.my_location_outlined,
                    title: "location",
                  ),
                  height12,
                  EducationDetail(
                    icon: Icons.date_range_outlined,
                    title: "birthday",
                  ),
                ],
              ),
            )),
      ),
    );
  }
}


/* delete */