import 'dart:io';

import 'package:cvapp/models/getprjectmodel%20.dart';
import 'package:cvapp/models/social_model.dart';
import 'package:cvapp/screens/add_project_screen.dart';
import 'package:image_picker/image_picker.dart';

List<Item> projectlist = [];
File? selectedimage;
Future pickImageFromGallery() async {
  final returnedimage =
      await ImagePicker().pickImage(source: ImageSource.gallery);

  if (returnedimage != null) {
    selectedimage = File(returnedimage.path);
  }
}

int socialcounter = 0;
List<SocialMediaModel> socialMediaList = [];
String twitter = "lib\\assets\\imges\\img7.png";
