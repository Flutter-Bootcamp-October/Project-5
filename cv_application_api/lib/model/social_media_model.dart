class SocialMedia {
  String? msg;
  List<SocialMediaData>? socialMediaData;
  int? codeState;

  SocialMedia({this.msg, this.socialMediaData, this.codeState});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      socialMediaData = <SocialMediaData>[];
      json['data'].forEach((v) {
        socialMediaData!.add(new SocialMediaData.fromJson(v));
      });
    }
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.socialMediaData != null) {
      data['data'] = this.socialMediaData!.map((v) => v.toJson()).toList();
    }
    data['codeState'] = this.codeState;
    return data;
  }
}

class SocialMediaData {
  int? id;
  int? userId;
  String? username;
  String? social;

  SocialMediaData({this.id, this.userId, this.username, this.social});

  SocialMediaData.fromJson(Map<String, dynamic> json) {
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
