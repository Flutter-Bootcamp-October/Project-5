import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:flutter/material.dart';

class SocialDropDownMenu extends StatefulWidget {
  const SocialDropDownMenu({
    Key? key,
    required this.onChanged,
    required this.title,
    required this.hintTitle,
  }) : super(key: key);

  final Function(String) onChanged;
  final String title;
  final String hintTitle;

  @override
  State<SocialDropDownMenu> createState() => _SocialDropDownMenuState();
}

class _SocialDropDownMenuState extends State<SocialDropDownMenu> {
  String? selectedSocialMedia;
  final List<String> socialMediaNames = [
    'facebook',
    'youtube',
    'whatsapp',
    'instagram',
    'twitter',
    'tiktok',
    'telegram',
    'snapchat'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: prussianBlue,
          ),
        ),
        height10,
        SizedBox(
          height: 55,
          child: DropdownButtonFormField<String>(
            value: selectedSocialMedia,
            onChanged: (String? value) {
              selectedSocialMedia = value;
              widget.onChanged(value!);
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            items: buildDropdownMenuItems(),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems() {
    return socialMediaNames.map((String universityName) {
      return DropdownMenuItem(
        value: universityName,
        child: Text(universityName),
      );
    }).toList();
  }
}
