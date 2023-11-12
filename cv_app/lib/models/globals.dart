import 'package:cv_app/models/education/education_data_model.dart';
import 'package:cv_app/models/projects/project_data_model.dart';
import 'package:cv_app/services/api/networking_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
List<EducationData> educationList = [];
List<ProjectData> projectsList = [];
bool hasToken = false;
final network = ConsentNetworking();

Future<bool> sharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  bool token = prefs.containsKey("token");
  return token;
}
