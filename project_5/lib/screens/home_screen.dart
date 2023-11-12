import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // File? image;

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // show all about data here then navigate to each screen (skills, projects, social, education) 
          // using a container button and make editing and deleting in these screens


          
          /**
           * profile image
           * 
           * name
           * title position
           *
           * information: phone, location, birthday
           * about paragraph
           * 
           * at the end creat acount date
           */
        ],
      ),
    );
  }
}
