import 'package:flutter/material.dart';

class ProfileDivsion extends StatelessWidget {
  ProfileDivsion({super.key, required this.title, required this.lineSize});
  String title;
  double lineSize;
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
                '$title',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * lineSize,
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
