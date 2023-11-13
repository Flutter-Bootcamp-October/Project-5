import 'dart:io';

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
