class Social {
  int? id;
  int? userId;
  String? username;
  String? social;

  Social({this.id, this.userId, this.username, this.social});

  Social.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    username = json['username'];
    social = json['social'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['username'] = username;
    data['social'] = social;
    return data;
  }
}
