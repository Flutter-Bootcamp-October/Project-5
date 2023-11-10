import 'package:flutter/material.dart';

class SettingsOption extends StatelessWidget {
  const SettingsOption({
    super.key,
    required this.onTapFunc,
    required this.title,
    required this.subTitle,
    this.iconData,
    required this.isSettings,
  });
  final Function() onTapFunc;
  final String title;
  final String subTitle;
  final IconData? iconData;
  final bool isSettings;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunc,
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: Visibility(
            visible: isSettings,
            child: const Icon(Icons.arrow_forward_ios_rounded, size: 20)),
        horizontalTitleGap: isSettings ? 20 : 0,
        contentPadding: isSettings
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
            : EdgeInsets.zero,
      ),
    );
  }
}
