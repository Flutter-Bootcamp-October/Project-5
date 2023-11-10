import 'package:flutter/material.dart';
import 'package:pcv/screens/edit_about.dart';

class DrawerScreens extends StatelessWidget {
  const DrawerScreens({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      children: [
        // const DrawerHeader(
        //   curve: Curves.easeInBack,
        //   margin: EdgeInsets.zero,
        //   padding: EdgeInsets.zero,
        //   decoration: BoxDecoration(
        //     color: Colors.transparent,
        //   ),
        //   child: Text('Drawer Header'),
        // ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditAboutScreen(),
                ));
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    );
  }
}
