class ProjectModel {
  ProjectModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final List<Data> data;
  late final int codeState;

  ProjectModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();

    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['codeState'] = codeState;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.state,
  });
  late final int id;
  late final int userId;
  late final String name;
  late final String description;
  late final String state;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['name'] = name;
    _data['description'] = description;
    _data['state'] = state;
    return _data;
  }
}
