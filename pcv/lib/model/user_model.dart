class UserModel {
  String? msg;
  List<Data>? data;
  int? codeState;

  UserModel({this.msg, this.data, this.codeState});

  UserModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['codeState'] = codeState;
    return data;
  }
}

class Data {
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
  List<Skills>? skills;
  List<SocialMedia>? socialMedia;
  List<Education>? education;
  List<Projects>? projects;

  Data(
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
      this.skills,
      this.socialMedia,
      this.education,
      this.projects});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
      });
    }
    if (json['social_media'] != null) {
      socialMedia = <SocialMedia>[];
      json['social_media'].forEach((v) {
        socialMedia!.add(SocialMedia.fromJson(v));
      });
    }
    if (json['education'] != null) {
      education = <Education>[];
      json['education'].forEach((v) {
        education!.add(Education.fromJson(v));
      });
    }
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(Projects.fromJson(v));
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
    if (skills != null) {
      data['skills'] = skills!.map((v) => v.toJson()).toList();
    }
    if (socialMedia != null) {
      data['social_media'] = socialMedia!.map((v) => v.toJson()).toList();
    }
    if (education != null) {
      data['education'] = education!.map((v) => v.toJson()).toList();
    }
    if (projects != null) {
      data['projects'] = projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Skills {
  int? id;
  int? userId;
  String? skill;

  Skills({this.id, this.userId, this.skill});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['skill'] = skill;
    return data;
  }
}

class SocialMedia {
  int? id;
  int? userId;
  String? username;
  String? social;

  SocialMedia({this.id, this.userId, this.username, this.social});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    username = json['username'];
    social = json['social'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['username'] = username;
    data['social'] = social;
    return data;
  }
}

class Education {
  int? id;
  int? userId;
  String? graduationDate;
  String? university;
  String? college;
  String? specialization;
  String? level;

  Education(
      {this.id,
      this.userId,
      this.graduationDate,
      this.university,
      this.college,
      this.specialization,
      this.level});

  Education.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    graduationDate = json['graduation_date'];
    university = json['university'];
    college = json['college'];
    specialization = json['specialization'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['graduation_date'] = graduationDate;
    data['university'] = university;
    data['college'] = college;
    data['specialization'] = specialization;
    data['level'] = level;
    return data;
  }
}

class Projects {
  int? id;
  int? userId;
  String? name;
  String? description;
  String? state;

  Projects({this.id, this.userId, this.name, this.description, this.state});

  Projects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['description'] = description;
    data['state'] = state;
    return data;
  }
}
