import 'package:flutter/material.dart';
import 'package:project_5/data/global_data.dart';
import 'package:project_5/models/users_model.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/reusable_widgets/custom_app_bar.dart';
import 'package:project_5/screens/users/user_details_screen.dart';
import 'package:project_5/services/get_users_api.dart';
import 'package:project_5/theme/shimmer/shimmer_list_all_users.dart';

class DisplayUsersScreen extends StatefulWidget {
  const DisplayUsersScreen({Key? key}) : super(key: key);

  @override
  State<DisplayUsersScreen> createState() => _DisplayUsersScreenState();
}

class _DisplayUsersScreenState extends State<DisplayUsersScreen> {
  Future? usersModelData;
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    usersModelData = getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(hasAction: false, title: "All Users"),
      body: FutureBuilder(
        future: usersModelData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UsersModel usersModel = snapshot.data;
            return ListView.builder(
              itemCount: usersModel.data!.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  navigation(
                    context: context,
                    screen:
                        UsersDetailsScreen(userModel: usersModel.data![index]),
                    type: "push",
                  );
                },
                child: Card(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        foregroundImage: usersModel.data![index].image != null
                            ? NetworkImage(usersModel.data![index].image!)
                            : NetworkImage(placeHolderImage),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("${usersModel.data![index].name}"),
                          subtitle:
                              Text(usersModel.data?[index].about ?? "No Bio"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const ShimmerListAllUsers();
          }
        },
      ),
    );
  }
}
