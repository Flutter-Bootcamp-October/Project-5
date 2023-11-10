import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:project_5/data/global_data.dart';
import 'package:project_5/screens/reusable_widgets/custom_app_bar.dart';

class ThemeSettingsScreen extends StatefulWidget {
  const ThemeSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ThemeSettingsScreen> createState() => _ThemeSettingsState();
}

class _ThemeSettingsState extends State<ThemeSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Theme", hasAction: false),
      body: ListView(
        children: [
          ListTile(
              title: Text("${isDarkTheme ? "Light" : "Dark"} Mode"),
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedToggleSwitch<bool>.rolling(
                  current: isDarkTheme,
                  values: const [true, false],
                  onChanged: (i) {
                    isDarkTheme = i;
                    setState(() {});
                  },
                  style: const ToggleStyle(backgroundColor: Colors.transparent),
                  styleBuilder: (value) => ToggleStyle(
                    indicatorColor: value ? Colors.yellow : Colors.black,
                  ),
                  iconBuilder: (value, foreground) => value == false
                      ? const Icon(Icons.nightlight_round_rounded)
                      : const Icon(Icons.sunny),
                ),
              ))
        ],
      ),
    );
  }
}
