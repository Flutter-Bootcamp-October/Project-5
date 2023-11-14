import 'package:cv_app_project/components/profile/profile_divsion.dart';
import 'package:cv_app_project/components/profile/social_media_account.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 24),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: Color(0xff0C356A),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffFFF0CE),
                          radius: 48,
                          child: Image.asset(
                            'lib/assets/images/person.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Abdullah Mubarak Almubarak',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'cupyne@socam.me',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '0523456789',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Mobile developer',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            1 > 0
                                ? Text(
                                    'Khobar',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(),
                            SizedBox(height: 8),
                            Text(
                              '1999/10/10',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            AboutInfo(),
            EducationInfo(),
            projectInfo(),
            SKillInfo(),
            SocialMedialInfo(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class SocialMedialInfo extends StatelessWidget {
  const SocialMedialInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileDivsion(
          title: 'Social Media',
          lineSize: 0.55,
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
                      SocialAccount(
                        username: 'Snapchat',
                        src: 'lib/assets/images/snapchat.png',
                      ),
                      SocialAccount(
                        username: ' Whatsapp',
                        src: 'lib/assets/images/whatsapp.png',
                      ),
                      SocialAccount(
                        username: ' Facebook',
                        src: 'lib/assets/images/facebook.png',
                      ),
                      SocialAccount(
                        username: ' Instagram',
                        src: 'lib/assets/images/instagram.png',
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

class SKillInfo extends StatelessWidget {
  const SKillInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileDivsion(
          title: 'Skills',
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
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Container(width: double.infinity),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff0174BE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'OOP',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff0174BE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Flutter',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff0174BE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Soft Skills',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff0174BE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Documenting',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff0174BE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Dart',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
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

class projectInfo extends StatelessWidget {
  const projectInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileDivsion(
          title: 'Projects',
          lineSize: 0.70,
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
                    children: [
                      Container(width: double.infinity),
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Color(0xff0174BE),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Food App',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Food App UI created by flutter framwork',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Completed',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Color(0xff0174BE),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CV App',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'CV App UI with functionality and using APIs created by flutter framwork',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'In Progress',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
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

class EducationInfo extends StatelessWidget {
  const EducationInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileDivsion(
          title: 'Education',
          lineSize: 0.65,
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
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Color(0xff0174BE),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'IAU',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Colle of Computer Science & IT',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'CS Major',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Mobile Developer',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '2023/6/23',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
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
                        'jehrjkhgkjerhkg kjh kjhkj hjkh kjh kjh kjhkjhkjh kh kjh kh oikpo l;klh kgjy gj gj',
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
