import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  const Education({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BACHELOR’S DEGREE IN SOFTWARE ENGINEERING",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "2018 - 2023",
              style: TextStyle(fontSize: 16),
            ),
            Text("King Fahd University of Petroleum and Minerals",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
          ],
        ));
  }
}
