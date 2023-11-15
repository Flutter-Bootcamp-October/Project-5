import 'package:cv_app_project/components/appBar/appBar.dart';
import 'package:cv_app_project/components/profile/social_media_account.dart';
import 'package:cv_app_project/screens/add_social.dart';
import 'package:cv_app_project/services/social_api.dart';
import 'package:flutter/material.dart';

class EditSocialMediaScreen extends StatelessWidget {
  const EditSocialMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        'Social Media',
        () {
          Navigator.pop(context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0C356A),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddSocial(),
              ));
        },
      ),
      body: FutureBuilder(
        future: getSocial(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error');
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Card(
                    color: Color(0xffFFC436),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xff0174BE),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SocialAccount(
                              username:
                                  snapshot.data!.data![i].username.toString(),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 16);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
