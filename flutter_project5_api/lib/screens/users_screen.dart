import 'package:flutter/material.dart';
import 'package:flutter_project5_api/models/errorr.dart';
import 'package:flutter_project5_api/models/users.dart'
    as userModel; 
import 'package:flutter_project5_api/servers_api/get_all_users_api.dart';

class UsersScreen extends StatefulWidget {
  final String? token;

  const UsersScreen({Key? key, this.token}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late Future<dynamic> usersFuture;

  @override
  void initState() {
    super.initState();
    usersFuture = getAllUsers(token: widget.token ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: FutureBuilder<dynamic>(
        future: usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data is userModel.Users) {
            userModel.Users users = snapshot.data;
            return _buildUsersList(users);
          } else if (snapshot.hasData && snapshot.data is ErrorModel) {
            ErrorModel error = snapshot.data;
            return Center(child: Text('Error: ${error.msg}'));
          } else {
            return Center(child: Text('Unexpected error occurred.'));
          }
        },
      ),
    );
  }

  Widget _buildUsersList(userModel.Users users) {
    return ListView.separated(
      itemCount: users.data?.length ?? 0,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        userModel.Data user = users.data![index];
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(user.name ?? 'No Name'),
            // Add more details as needed
          ),
        );
      },
    );
  }
}
