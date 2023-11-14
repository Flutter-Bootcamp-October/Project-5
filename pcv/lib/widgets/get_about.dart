import 'package:flutter/material.dart';
import 'package:pcv/widgets/conta_home_widget.dart';

Map about = {};

class GetAbout extends StatefulWidget {
  const GetAbout({super.key});

  @override
  State<GetAbout> createState() => _GetAboutState();
}

class _GetAboutState extends State<GetAbout> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (about["image"] != null)
            ClipOval(
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.network(about["image"]),
              ),
            ),
          Column(
            children: [
              Text(
                ' ${about["name"].toString()}',
                style: const TextStyle(fontSize: 28),
              ),
              if (about["title_position"] != null)
                Text(
                  about["title_position"].toString(),
                  style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                ),
            ],
          ),
        ],
      ),
      if (about["about"] != null)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(about["about"].toString()),
        ),
      const SizedBox(
        height: 24,
      ),
      ContaHomeWidget(
        icon: Icons.email,
        text: about["email"].toString(),
      ),
      ContaHomeWidget(
        icon: Icons.phone,
        text: about["phone"].toString(),
      ),
      if (about["location"] != null)
        ContaHomeWidget(
          icon: Icons.location_on,
          text: about["location"].toString(),
        ),
      if (about["birthday"] != null)
        ContaHomeWidget(
          icon: Icons.date_range_outlined,
          text: about["birthday"].toString(),
        ),
    ]);
  }
}
