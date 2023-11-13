import 'dart:convert';
import 'dart:io';

import 'package:cvapp/screens/register_screen.dart';
import 'package:cvapp/utils/api_endpoints.dart';
import 'package:cvapp/wedgets/profile_image.dart';
import 'package:cvapp/wedgets/sginup_wedget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class Item {
  String name;
  String description;
  String state;

  Item({required this.name, required this.description,required this.state});
}


class _HomeScreenState extends State<HomeScreen> {
  File? selectedimage;
  List<Item> items = [];
  bool isvalid=false;
  TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
     TextEditingController stateController = TextEditingController();
  

  void _addItem(String name, String description, String state) {
    if (name.isNotEmpty && description.isNotEmpty) {
      setState(() {
        items.add(Item(name: name, description: description, state: state));
      });
    }
  }

  void _showAddItemDialog() {
    
   


    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'Enter project name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(hintText: 'Enter project description'),
              ),
               TextField(
                controller: stateController,
                decoration: InputDecoration(hintText: 'state (completed or processing)'),
              ),
              
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              
              onPressed: () {
                
                _addItem(nameController.text, descriptionController.text, stateController.text);
               
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
   void dispose() {
  // Dispose controllers when the widget is disposed
  nameController.dispose();
  descriptionController.dispose();
  stateController.dispose();
  super.dispose();
}

Future<void> pushproject() async {
  try {
    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.project);

    Map body = {
      'name': nameController.text,
      'description': descriptionController.text,
      'state': stateController.text,
    };

    http.Response response = await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      isvalid = true; // Consider using setState if this affects UI
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Success!')));
      // Clear the text fields after success
      nameController.clear();
      descriptionController.clear();
      stateController.clear();
    } else {
      // Handle different responses
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to push project.')));
    }
  } catch (e) {
    // Handle the exception
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('An error occurred: $e')));
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8C5CB3),
      body: Column(
       
        children: [
          SizedBox(height: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             if (selectedimage != null)
            ProfileImage(selectedimage: selectedimage),
            SizedBox(height: 20,),
            Text("welcome conan"),
          
          
          TextButton(
            onPressed: _pickImageFromGallery,
            child: Text("chane image"),
          ),

          ],),
          
         
         
          Divider(thickness: 1,),
          Stack(children: [
            InkWell(
              onTap: () {
                _showAddItemDialog();
                
              },
              child: Container(width: 200,height: 100,decoration: BoxDecoration(boxShadow: [BoxShadow(offset: Offset(3, 4), blurRadius: 12, color: Colors.black)],borderRadius: BorderRadius.circular(16),color: Colors.white),)),
            Positioned(top: 60,left: 90,child: Text("projects",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            Positioned(top: 20,left: 130,child: Text("${items.length}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          
            
          ],),
         SinUpWedget(Controller: nameController,
                    labelText: "   Enter your name"),
                    SinUpWedget(Controller: descriptionController,
                    labelText: "   Enter your descrp"),
                    SinUpWedget(Controller: stateController,
                    labelText: "   Enter your state"),
          ElevatedButton(onPressed: ()async{
            await pushproject();
        
          }, child: Text("push"))

     ],
      ),
      
    );
  }

  Future _pickImageFromGallery() async {
    final returnedimage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedimage != null) {
      setState(() {
       
        selectedimage = File(returnedimage.path);
      });
    }
  }
}

