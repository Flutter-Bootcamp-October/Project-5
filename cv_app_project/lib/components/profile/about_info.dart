import 'package:cv_app_project/components/profile/profile_divsion.dart';
import 'package:flutter/material.dart';

class AboutInfo extends StatelessWidget {
  const AboutInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileDivsion(
          title: 'About',
          lineSize: 0.75,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Card(
                color: Color(0xffFFC436),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(width: double.infinity),
                      Text(
                        'A fresh graduated student from IAU with bacholer of Computer Science',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
