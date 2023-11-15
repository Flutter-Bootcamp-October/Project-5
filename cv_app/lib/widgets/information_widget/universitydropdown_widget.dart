import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:flutter/material.dart';

class UniversityDropDownMenu extends StatefulWidget {
  const UniversityDropDownMenu({
    Key? key,
    required this.onChanged,
    required this.title,
    required this.hintTitle,
  }) : super(key: key);

  final Function(String) onChanged;
  final String title;
  final String hintTitle;

  @override
  State<UniversityDropDownMenu> createState() => _UniversityDropDownMenuState();
}

class _UniversityDropDownMenuState extends State<UniversityDropDownMenu> {
  String? selectedUniversity;
  final List<String> universityNames = [
    'Imam',
    'Saud',
    'Nourh',
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
            value: selectedUniversity,
            onChanged: (String? value) {
              setState(() {
                selectedUniversity = value;
                widget.onChanged(value!);
              });
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
    return universityNames.map((String universityName) {
      return DropdownMenuItem(
        value: universityName,
        child: Text(universityName),
      );
    }).toList();
  }
}
