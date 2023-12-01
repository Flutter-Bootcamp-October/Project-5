import 'package:flutter/material.dart';
import 'package:pcv/model/about_model.dart';
import 'package:pcv/services/api_about.dart';
import 'package:pcv/widgets/card_user.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  AboutModel? aboutData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUser();
    print(aboutData!.data);
  }
  loadUser()async{
   aboutData= await netAbout.getUserMethod(context: context);
   setState(() {

   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body:SafeArea(
          child: SingleChildScrollView(
            child:
            SizedBox(height: 400,
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: 3,
                crossAxisCount: 1,
                children: [
                  if(aboutData!.data==null)
                const Center(child: CircularProgressIndicator()),
                if(aboutData!.data!=null)
                  CardUser(image: aboutData!.data!.image, name: aboutData!.data!.name.toString(),
                      email: aboutData!.data!.email.toString(), phone: aboutData!.data!.phone.toString())
              ],)
            )
            ),
          ),
    );
  }
}
