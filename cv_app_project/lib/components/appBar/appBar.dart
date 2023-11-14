import 'package:flutter/material.dart';

getAppBar(String title, Function() onTap) {
  return AppBar(
    leading: InkWell(
      onTap: onTap,
      child: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
        // size: 24,
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
  );
}
