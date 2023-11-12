class Social {
  int? id;
  String? username;
  String? social;

  Social({this.id, this.username, this.social});

  Social.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    social = json['social'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['social'] = social;
    data['id'] = id;

    return data;
  }
}
