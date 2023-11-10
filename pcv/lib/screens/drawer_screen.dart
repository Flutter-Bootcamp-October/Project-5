import 'package:flutter/material.dart';
import 'package:pcv/screens/edit_about.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreens extends StatelessWidget {
  const DrawerScreens({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const DrawerHeader(
            // decoration: BoxDecoration(
            //   color: Colors.transparent,
            // ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Update information'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditAboutScreen(),
                  ));
              // Update the state of the app.
              // ...
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          const Spacer(),
          ListTile(
            title: const Text(
              'Delete Account',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              showAdaptiveDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Are You Sure Delete Account?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("back"),
                    ),
                    TextButton(
                      onPressed: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        final token = prefs.getString('token');
                        network.deleteAccountMethod(token: token!);
                      },
                      child: const Text("DELETE"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
