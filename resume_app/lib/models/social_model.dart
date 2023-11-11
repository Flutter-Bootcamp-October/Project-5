class Social {
  Social({
    required this.id,
    required this.userId,
    required this.username,
    required this.social, //'facebook','youtube', 'whatsapp', 'instagram', 'twitter', 'tiktok', 'telegram', 'snapchat','other'
  });
  late final int id;
  late final int userId;
  late final String username;
  late final String social;

  Social.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    username = json['username'];
    social = json['social'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['social'] = social;
    return data;
  }
}
