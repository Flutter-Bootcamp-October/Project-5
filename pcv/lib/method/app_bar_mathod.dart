import 'package:flutter/material.dart';

AppBar appBarMethod({required String title}) {
  return AppBar(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
    toolbarHeight: 30,
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xffff6700),
    title: Text(title),
    centerTitle: true,
  );
}
