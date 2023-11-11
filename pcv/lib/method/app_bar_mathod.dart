import 'package:flutter/material.dart';

AppBar appBarMethod({required String title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title:  Text(title),
    centerTitle: true,
  );
}
