import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_5/data/global_data.dart';
import 'package:project_5/main.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  changeThemeFunc({required bool isDark}) {
    isDarkTheme = isDark;
    pref.isDarkThemePref(isDark);
    emit(ThemeChanged(isDarkMode: isDark));
  }

  getThemeFunc() {
    emit(ThemeChanged(isDarkMode: pref.getTheme()));
  }
}
