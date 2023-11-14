import 'package:resume_app/models/about_model.dart';
import 'package:resume_app/models/education_model.dart';
import 'package:resume_app/models/project_model.dart';
import 'package:resume_app/models/skill_model.dart';
import 'package:resume_app/models/social_model.dart';

late About userAbout;
late List<Project> userProjects;
late List<Education> userEducation;
late List<Skill> userSkills;
late List<Social> userSocials;
RegExp dateFormat = RegExp("([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))");
