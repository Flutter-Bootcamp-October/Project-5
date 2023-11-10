class Social {
  String? username;
  String? social;

  Social({this.username, this.social});

  Social.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    social = json['social'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['social'] = social;
    return data;
  }
}
