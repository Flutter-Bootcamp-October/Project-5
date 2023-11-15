import 'package:flutter/material.dart';
import 'package:project_5/widgets/ProfileDetailrow.dart';

Widget buildProfileDetailRow(
    String title1, String value1, String title2, String value2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ProfileDetailRow(
        title: title1,
        value: value1,
      ),
      ProfileDetailRow(
        title: title2,
        value: value2,
      ),
    ],
  );
}
