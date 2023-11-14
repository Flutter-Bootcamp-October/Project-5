import 'package:cv_application_api/constant/constant.dart';
import 'package:flutter/material.dart';

class DropDownButtom extends StatefulWidget {
  const DropDownButtom({super.key});

  @override
  State<DropDownButtom> createState() => _DropDownButtomState();
}

class _DropDownButtomState extends State<DropDownButtom> {
  List<String> level = [
    'school',
    'diploma',
    'Bachelors',
    'Master',
    'Ph.D',
    'other'
  ];
  String? selectedLevel = 'diploma';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 2, color: appGreenTrans)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 2, color: appGreenTrans))),
          value: selectedLevel,
          items: level
              .map(
                (element) => DropdownMenuItem<String>(
                    value: element, child: Text(element)),
              )
              .toList(),
          onChanged: (value) => setState(() => selectedLevel = value)),
    );
  }
}
