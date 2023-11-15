import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_project5_api/servers_api/about/edit_about_api.dart';
import 'package:flutter_project5_api/servers_api/about/user_delccount_api.dart';
import 'package:flutter_project5_api/servers_api/about/user_upload_api.dart';
import 'package:flutter_project5_api/widgets/textfelides.dart';
import 'package:glass/glass.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final ImagePicker picker = ImagePicker();
  File? imageFile;
  TextEditingController nameController = TextEditingController();
  TextEditingController titlePositionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  Future getImage() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ))!;

    if (picked != null && picked != DateTime.now()) {
      birthdayController.text = picked.toLocal().toString().split(' ')[0];
    }
  }

  Future<void> _editAccount() async {
    // Prepare your request body
    final Map<String, dynamic> body = {
      "name": nameController.text,
      "title_position": titlePositionController.text,
      "phone": phoneController.text,
      "location": locationController.text,
      "birthday": birthdayController.text,
      "about": aboutController.text,
    };

    
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await editAbout(token: token!, body: {
        "name": nameController.text,
        "phone": phoneController.text,
        "title_position": titlePositionController.text,
        "location": locationController.text,
        "about": aboutController.text,
        "birthday": birthdayController.text,
      });
      
      if (response.codeState == 200) {
      
        print("Account updated successfully!");
      } else {
        // Handle the error
        print("Failed to update account. Error: ${response.msg}");
      }
    } catch (error) {
    
      print("Error: $error");
    }
  }

  Future<void> _uploadImage() async {

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await uploadimage(token: token!, image: imageFile!);
      
      if (response.codeState == 200) {
       
        print("Image uploaded successfully!");
      } else {
        
        print("Failed to upload image. Error: ${response.msg}");
      }
    } catch (error) {
      
      print("Error: $error");
    }
  }

  Future<void> _deleteAccount() async {
   
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await deleteabout(token: token!);
      
      if (response.codeState == 200) {
    
        print("Account deleted successfully!");
        
      } else {
       
        print("Failed to delete account. Error: ${response.msg}");
      }
    } catch (error) {
      // Handle exceptions
      print("Error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.7),
        centerTitle: true,
        title: Text(
          'Personal Information',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Color.fromARGB(255, 26, 8, 90),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: getImage,
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        imageFile != null ? FileImage(imageFile!) : null,
                    child: imageFile == null
                        ? Icon(Icons.camera_alt, size: 50, color: Colors.white)
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              CustomTextField(hint: "Name", controller: nameController),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hint: "Title/Position",
                controller: titlePositionController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(hint: "Phone", controller: phoneController),
              SizedBox(
                height: 10,
              ),
              CustomTextField(hint: "Location", controller: locationController),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: birthdayController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    hintText: "Birthday",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ).asGlass(
                  tintColor: Colors.transparent,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hint: "About",
                controller: aboutController,
                maxLines: 3,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _editAccount();
                  },
                  child: Text('Save Changes'),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _uploadImage();
                  },
                  child: Text('Upload Image'),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _deleteAccount();
                  },
                  child: Text('Delete Account'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
