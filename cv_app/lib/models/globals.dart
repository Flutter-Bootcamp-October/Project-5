import 'package:cv_app/models/education/education_data_model.dart';
import 'package:cv_app/models/projects/project_data_model.dart';
import 'package:cv_app/services/api/networking_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<EducationData> educationList = [];
List<ProjectData> projectsList = [];
bool hasToken = false;
final network = ConsentNetworking();

Future<bool> sharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('token')) {
    return true;
  } else {
    return false;
  }
}

check() async {
  hasToken = await sharedPreferences();
  return hasToken;
}

class DataLoader {
  static Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
