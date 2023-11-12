import 'package:flutter/material.dart';

TabBar tabBar = TabBar(
    isScrollable: true,
    labelColor: Colors.black,
    labelStyle: const TextStyle(
        letterSpacing: 1,
        fontSize: 20,
        fontFamily: 'Oswald',
        fontWeight: FontWeight.bold),
    indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Creates border
        color: Colors.amber),
    tabs: const [
      Tab(
        text: "About You",
      ),
      Tab(
        text: "More",
      )
    ]);
