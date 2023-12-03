import 'dart:developer';

import 'package:cv_app_project/models/community_model.dart';
import 'package:cv_app_project/services/community_api.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({
    super.key,
  });

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<CommuityModel>(
            future: getCommuity(),
            builder: (context, snapshot) {
              log(snapshot.data.toString());
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Error');
              } else {
                return ListView.separated(
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(snapshot.data!.data![i].name.toString()),
                        subtitle:
                            Text(snapshot.data!.data![i].phone.toString()),
                        trailing:
                            Text(snapshot.data!.data![i].email.toString()),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16);
                    },
                    itemCount: snapshot.data!.data!.length);
              }
            },
          ),
        ),
      ),
    );
  }
}
