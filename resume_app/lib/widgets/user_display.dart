import 'package:flutter/material.dart';
import 'package:resume_app/consts/buttons.dart';
import 'package:resume_app/consts/colors.dart';
import 'package:resume_app/widgets/upper_display.dart';

class UserDisplay extends StatefulWidget {
  const UserDisplay({
    super.key,
  });

  @override
  State<UserDisplay> createState() => UserDisplayState();
}

class UserDisplayState extends State<UserDisplay> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const UpperDisplay(),
          bottom: tabBar,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appBlue,
          onPressed: () {},
          child: const Icon(Icons.picture_as_pdf_sharp),
        ),
        backgroundColor: Colors.transparent,
        body: const TabBarView(
          children: [
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
          ],
        ),
      ),
    );
  }
}
