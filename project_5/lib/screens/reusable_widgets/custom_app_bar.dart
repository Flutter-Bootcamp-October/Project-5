import 'package:flutter/material.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/settings/settings_screen.dart';
import 'package:project_5/screens/users/display_users_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.hasAction,
    required this.title,
    this.currentUser,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final bool hasAction;
  final String title;
  final currentUser;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: isDarkTheme ? const Color(0xffe1dfef) : Colors.black,
      elevation: 1.5,
      scrolledUnderElevation: 2.5,
      automaticallyImplyLeading: !hasAction,
      centerTitle: hasAction,
      actions: [
        Visibility(
          visible: hasAction,
          child: Row(
            children: [
              IconButton(
                  iconSize: 26,
                  onPressed: () {
                    navigationPush(
                        context: context, screen: const DisplayUsersScreen());
                  },
                  icon: const Icon(Icons.people)),
              IconButton(
                  iconSize: 26,
                  onPressed: () {
                    navigationPush(
                        context: context,
                        screen: SettingsScreen(
                          currentUserInfo: currentUser,
                        ));
                  },
                  icon: const Icon(Icons.settings_outlined)),
            ],
          ),
        )
      ],
      title: Text(title),
    );
  }
}
