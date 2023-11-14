class SocialModel {
  SocialModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final List<Data>? data;
  late final int codeState;

  SocialModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    _data['codeState'] = codeState;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.username,
    required this.social,
  });
  late final int id;
  late final int userId;
  late final String username;
  late final String social;

  Data.fromJson(Map<String, dynamic> json) {
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
