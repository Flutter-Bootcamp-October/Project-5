import 'package:cv/constants/colors.dart';
import 'package:flutter/material.dart';

class AddNewButton extends StatelessWidget {
  const AddNewButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.color,
      required this.iconColor});

  final String title;
  final Function() onTap;
  final Color color;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width - 280,
        height: MediaQuery.of(context).size.height - 804,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.add_circle_outline_outlined,
                color: iconColor,
                size: 20,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
