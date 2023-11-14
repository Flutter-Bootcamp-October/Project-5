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
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (social.isNotEmpty)
        const TitlesWidget(
          titles: 'Social',
        ),
      GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 1.5,
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: social
              .map((e) => Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100.withOpacity(0.2),
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(15),
                            right: Radius.circular(15))),
                    child: ListTile(
                        title: Text(
                          "${e["username"]}",
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Image.asset(
                          "assets/${e["social"]}.png",
                        )),
                  ))
              .toList())
    ]);
  }
}
