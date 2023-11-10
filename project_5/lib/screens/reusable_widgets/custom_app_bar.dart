import 'package:flutter/material.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/settings/settings_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.hasAction,
    required this.title,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final bool hasAction;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffe1dfef),
      elevation: 1.5,
      scrolledUnderElevation: 2.5,
      automaticallyImplyLeading: !hasAction,
      centerTitle: hasAction,
      actions: [
        Visibility(
          visible: hasAction,
          child: IconButton(
              iconSize: 26,
              onPressed: () {
                navigationPush(
                    context: context, screen: const SettingsScreen());
              },
              icon: const Icon(Icons.settings_outlined)),
        )
      ],
      title: Text(title),
    );
  }
}
