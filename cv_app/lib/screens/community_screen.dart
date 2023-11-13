import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/services/users.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: showUsers(),
        builder: ((context, snapshot) {
          if (snapshot.data != null) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(snapshot.data![index].id.toString()),
                    title: Text(snapshot.data![index].name.toString()),
                    trailing: Text(snapshot.data![index].phone.toString()),
                  ),
                );
              }),
              separatorBuilder: (context, index) => const Divider(),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(color: mainColor));
          }
        }));
  }
}
