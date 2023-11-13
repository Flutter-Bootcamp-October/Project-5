import 'package:flutter/material.dart';
import 'package:resume_app/consts/buttons.dart';
import 'package:resume_app/consts/colors.dart';
import 'package:resume_app/consts/decotation.dart';
import 'package:resume_app/globals/global.dart';
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
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(children: [
                  const SizedBox(height: 15),
                  TextField(
                    maxLines: 1,
                    decoration: returnDec(
                        icon: const Icon(Icons.person),
                        hint: userAbout.name!,
                        labelText: 'Name'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    maxLines: 1,
                    // controller: emailController,
                    decoration: returnDec(
                        icon: const Icon(Icons.email_outlined),
                        hint: 'Enter Your Position Title',
                        labelText: 'Title-Position'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    maxLines: 1,
                    // controller: phoneController,
                    decoration: returnDec(
                        icon: const Icon(Icons.phone_android_outlined),
                        hint: 'Enter Your Phone Number',
                        labelText: 'Phone Number'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    maxLines: 1,
                    // controller: phoneController,
                    decoration: returnDec(
                        icon: const Icon(Icons.pin_drop_outlined),
                        hint: 'Enter Your Location',
                        labelText: 'Location'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    maxLines: 1,
                    // controller: phoneController,
                    decoration: returnDec(
                        icon: const Icon(Icons.date_range_outlined),
                        hint: 'Enter Your Birthday',
                        labelText: 'Birthday'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    maxLines: null,
                    // controller: phoneController,
                    decoration: returnDec(hint: '...', labelText: 'Summary'),
                  ),
                ]),
              ),
              const Icon(Icons.directions_transit, size: 350),
            ],
          ),
        ),
      ),
    );
  }
}
