import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/bloc/theme_bloc/theme_cubit.dart';
import 'package:project_5/bloc/theme_bloc/theme_cubit.dart';
import 'package:project_5/data/global_data.dart';
import 'package:project_5/main.dart';
import 'package:project_5/screens/reusable_widgets/custom_app_bar.dart';

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({Key? key, this.state}) : super(key: key);

  final dynamic state;
  @override
  Widget build(BuildContext context) {
    state is ThemeInitial
        ? context.read<ThemeCubit>().getThemeFunc()
        : const SizedBox();
    return Scaffold(
      appBar: const CustomAppBar(title: "Theme", hasAction: false),
      body: ListView(
        children: [
          ListTile(
              title: Text("${isDarkTheme ? "Dark" : "Light"} Mode"),
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedToggleSwitch<bool>.rolling(
                    current: isDarkTheme,
                    values: const [true, false],
                    onChanged: (i) {
                      // isDarkTheme = i;
                      // pref.isDarkThemePref(i);
                      context.read<ThemeCubit>().changeThemeFunc(isDark: i);
                    },
                    style:
                        const ToggleStyle(backgroundColor: Colors.transparent),
                    styleBuilder: (value) {
                      return ToggleStyle(
                        indicatorColor: state is ThemeChanged
                            ? !state.isDarkMode
                                ? Colors.yellow
                                : Colors.black
                            : Colors.black,
                      );
                    },
                    iconBuilder: (value, foreground) {
                      return !value == false
                          ? const Icon(Icons.nightlight_round_rounded)
                          : const Icon(Icons.sunny);
                    }),
              ))
        ],
      ),
    );
  }
}
