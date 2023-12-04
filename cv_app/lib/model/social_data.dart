class SocialData {
  int? id;
  int? userId;
  String? username;
  String? social;

  SocialData({this.id, this.userId, this.username, this.social});

  SocialData.fromJson(Map<String, dynamic> json) {
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
