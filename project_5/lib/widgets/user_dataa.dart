import 'package:flutter/material.dart';
import 'package:project_5/model/user_model.dart';

class UserProfileWidget extends StatelessWidget {
  final UserData userData;

  UserProfileWidget({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 29, 29, 39),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          _buildDeleteButton(),
          _buildUserProfileDetails(),
        ],
      ),
    );
  }

  Widget _buildDeleteButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularButtonDelete(
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildUserProfileDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildUserProfileImage(),
        _buildUserProfileInfo(),
      ],
    );
  }

  Widget _buildUserProfileImage() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
        maxRadius: 50,
        minRadius: 50,
        backgroundColor: Color.fromARGB(118, 255, 193, 7),
        backgroundImage: AssetImage("assets/images/User.png"),
      ),
    );
  }

  Widget _buildUserProfileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Name: ${userData.name}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        // Add other widgets as needed
      ],
    );
  }
}

class CircularButtonDelete extends StatelessWidget {
  final VoidCallback? onPressed;

  CircularButtonDelete({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(12.0),
      ),
      onPressed: onPressed,
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.delete_forever_outlined,
            size: 24.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
