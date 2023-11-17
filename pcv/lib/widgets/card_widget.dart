import 'package:flutter/material.dart';
import 'package:pcv/widgets/get_about.dart';
import '../model/about_model.dart';
import '../services/api_about.dart';
class AboutData extends StatefulWidget {
  const AboutData(
      {super.key,
        });

  @override
  State<AboutData> createState() => _AboutDataState();
}

class _AboutDataState extends State<AboutData> {
  AboutModel? dataAbout;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingAbout();
  }
  loadingAbout()async{
    dataAbout=await netAbout.aboutMethod(context: context);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Column(children: [
        if(dataAbout!=null)
          GetAbout(name: dataAbout?.data?.name,
            titlePosition: dataAbout?.data?.titlePosition,
            about: dataAbout?.data?.about,
            email: dataAbout?.data?.email,
            phone: dataAbout?.data?.phone,
            image: dataAbout!.data?.image,
          birthday: dataAbout!.data!.birthday,)

      ])
    );
  }
}