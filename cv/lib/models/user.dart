import 'package:cv/models/education.dart';
import 'package:cv/models/project.dart';
import 'package:cv/models/skill.dart';
import 'package:cv/models/social.dart';

class User {
  int? id;
  String? idAuth;
  String? name;
  String? createAt;
  String? titlePosition;
  String? phone;
  String? email;
  String? location;
  String? birthday;
  String? about;
  String? image;
  List<Education>? education;
  List<Skill>? skills;
  List<Social>? socialMedia;
  List<Project>? projects;

  User(
      {this.id,
      this.idAuth,
      this.name,
      this.createAt,
      this.titlePosition,
      this.phone,
      this.email,
      this.location,
      this.birthday,
      this.about,
      this.image,
      this.education,
      this.skills,
      this.socialMedia,
      this.projects});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idAuth = json['id_auth'];
    name = json['name'];
    createAt = json['create_at'];
    titlePosition = json['title_position'];
    phone = json['phone'];
    email = json['email'];
    location = json['location'];
    birthday = json['birthday'];
    about = json['about'];
    image = json['image'];
    if (json['education'] != null) {
      education = <Education>[];
      json['education'].forEach((v) {
        education!.add(Education.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skill>[];
      json['skills'].forEach((v) {
        skills!.add(Skill.fromJson(v));
      });
    }
    if (json['socialMedia'] != null) {
      socialMedia = <Social>[];
      json['socialMedia'].forEach((v) {
        socialMedia!.add(Social.fromJson(v));
      });
    }
    if (json['projects'] != null) {
      projects = <Project>[];
      json['projects'].forEach((v) {
        projects!.add(Project.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_auth'] = idAuth;
    data['name'] = name;
    data['create_at'] = createAt;
    data['title_position'] = titlePosition;
    data['phone'] = phone;
    data['email'] = email;
    data['location'] = location;
    data['birthday'] = birthday;
    data['about'] = about;
    data['image'] = image;
    if (education != null) {
      data['education'] = education!.map((v) => v.toJson()).toList();
    }
    if (skills != null) {
      data['skills'] = skills!.map((v) => v.toJson()).toList();
    }
    if (socialMedia != null) {
      data['socialMedia'] = socialMedia!.map((v) => v.toJson()).toList();
    }
    if (projects != null) {
      data['projects'] = projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
