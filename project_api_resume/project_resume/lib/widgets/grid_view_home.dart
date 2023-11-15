import 'package:flutter/material.dart';

class GridViewHome extends StatelessWidget {
  GridViewHome(
      {super.key,
      required this.pageName,
      required this.page,
      required this.colorGridView,
      required this.iconGridView});

  String pageName;
  Function() page;
  Color colorGridView;
  IconData iconGridView;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => page()));
      },
      child: Container(
        width: 20,
        height: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: colorGridView),
        child: Column(
          children: [
            Icon(
              iconGridView,
              color: Colors.white,
              size: 100,
            ),
            Text(
              pageName,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
