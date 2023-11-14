class SocialMediaData {
  SocialMediaData({
    required this.username,
    required this.social,
  });
  late int id;
  late final int userId;
  late final String username;
  late final String social;

  SocialMediaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    username = json['username'];
    social = json['social'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['username'] = username;
    _data['social'] = social;
    return _data;
  }
}
