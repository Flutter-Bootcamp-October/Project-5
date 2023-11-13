import 'package:flutter/material.dart';
import 'package:pcv/screens/social_screen.dart';
import 'package:pcv/widgets/title_widget.dart';

class GetSocial extends StatefulWidget {
  const GetSocial({super.key});

  @override
  State<GetSocial> createState() => _GetSocialState();
}

class _GetSocialState extends State<GetSocial> {
  List socialList = <String>[
    'facebook',
    'youtube',
    'whatsapp',
    'instagram',
    'twitter',
    'tiktok',
    'telegram',
    'snapchat',
    'other'
  ];
  // List iconList = [
  //   const Icon(Icons.facebook),
  //   const Icon(Icons.tab),
  //   const Icon(Icons.wechat),
  //   const Icon(Icons.camera_alt_outlined),
  //   const Icon(Icons.egg),
  //   const Icon(Icons.tiktok),
  //   const Icon(Icons.telegram),
  //   const Icon(Icons.snapchat),
  //   const Icon(Icons.more),
  // ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const TitlesWidget(
        titles: 'Social',
      ),
      if (social.isNotEmpty)
        GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 2,
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: social
                .map((e) => Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100.withOpacity(0.2),
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(15),
                              right: Radius.circular(15))),
                      child: ListTile(
                        title: Text("${e["username"]}"),
                        subtitle: Text(
                          "${e["social"]} ",
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ))
                .toList())
    ]);
  }
}
