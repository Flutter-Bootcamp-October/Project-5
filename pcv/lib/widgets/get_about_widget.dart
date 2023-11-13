import 'package:flutter/material.dart';
import 'package:pcv/widgets/conta_home_widget.dart';

class GetAbout extends StatefulWidget {
  const GetAbout({super.key, required this.about});
  final Map about;
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
          ClipOval(
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.network(widget.about["image"]),
            ),
          ),
          Column(
            children: [
              Text(
                ' ${widget.about["name"].toString()}',
                style: const TextStyle(fontSize: 28),
              ),
              Text(
                widget.about["title_position"].toString(),
                style: TextStyle(fontSize: 16, color: Colors.grey[400]),
              ),
            ],
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(widget.about["about"].toString()),
      ),
      const SizedBox(
        height: 24,
      ),
      ContaHomeWidget(
        icon: Icons.email,
        text: widget.about["email"].toString(),
      ),
      ContaHomeWidget(
        icon: Icons.phone,
        text: widget.about["phone"].toString(),
      ),
      ContaHomeWidget(
        icon: Icons.location_on,
        text: widget.about["location"].toString(),
      ),
      ContaHomeWidget(
        icon: Icons.email,
        text: widget.about["birthday"].toString(),
      ),
    ]);
  }
}
