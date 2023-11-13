import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.4,
            color: Color(0xff0C356A),
          ),
          SizedBox(height: 24),
          ProfileDivsion(),
          ProfileDivsion(),
          ProfileDivsion(),
          ProfileDivsion(),
        ],
      ),
    );
  }
}

class ProfileDivsion extends StatelessWidget {
  const ProfileDivsion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.75,
                height: 2,
                color: Color(0xff0C356A),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
