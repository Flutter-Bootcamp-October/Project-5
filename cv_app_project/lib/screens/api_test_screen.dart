import 'package:cv_app_project/services/registration_api.dart';
import 'package:flutter/material.dart';

class APITestScreen extends StatefulWidget {
  const APITestScreen({super.key});

  @override
  State<APITestScreen> createState() => _APITestScreenState();
}

class _APITestScreenState extends State<APITestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Registeration
      body: FutureBuilder(
        future: createAccount('Anas', '055050', 'email', 'pass'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error');
          }
          if (snapshot.data == '1') {
            return Center(child: Text(snapshot.data));
          } else {
            return Center(child: Text('Failed'));
          }
        },
      ),
    );
  }
}
