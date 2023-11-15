class CommuityModel {
  String? msg;
  List<Data>? data;
  int? codeState;

  CommuityModel({this.msg, this.data, this.codeState});

  CommuityModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['codeState'] = this.codeState;
    return data;
  }
}

class Data {
  int? id;
  String? idAuth;
  String? name;
  String? createAt;
  Null? titlePosition;
  String? phone;
  String? email;
  Null? location;
  Null? birthday;
  Null? about;
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
        skills!.add(new Skills.fromJson(v));
      });
    }
    if (json['social_media'] != null) {
      socialMedia = <SocialMedia>[];
      json['social_media'].forEach((v) {
        socialMedia!.add(new SocialMedia.fromJson(v));
      });
    }
    if (json['education'] != null) {
      education = <Education>[];
      json['education'].forEach((v) {
        education!.add(new Education.fromJson(v));
      });
    }
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_auth'] = this.idAuth;
    data['name'] = this.name;
    data['create_at'] = this.createAt;
    data['title_position'] = this.titlePosition;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['location'] = this.location;
    data['birthday'] = this.birthday;
    data['about'] = this.about;
    data['image'] = this.image;
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    if (this.socialMedia != null) {
      data['social_media'] = this.socialMedia!.map((v) => v.toJson()).toList();
    }
    if (this.education != null) {
      data['education'] = this.education!.map((v) => v.toJson()).toList();
    }
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['skill'] = this.skill;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['social'] = this.social;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['graduation_date'] = this.graduationDate;
    data['university'] = this.university;
    data['college'] = this.college;
    data['specialization'] = this.specialization;
    data['level'] = this.level;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['state'] = this.state;
    return data;
  }
}
