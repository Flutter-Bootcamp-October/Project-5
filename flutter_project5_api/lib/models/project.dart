/*class Project {
  Project({
    required this.name,
    required this.description,
    required this.state,
  });
  late int id;
  late int userId;
  late String name;
  late String description;
  late String state;

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userId = json['user_id'] ?? 0;
    name = json['name'] ?? '';
    description = json['description'] ?? '';
    state = json['state'] ?? '';
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
class Data {
  Data({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final List<Project> data;
  late final int codeState;

  Data.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => Project.fromJson(e)).toList();
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['codeState'] = codeState;
    return _data;
  }
}*/
class Project {
  String? msg;
  List<Data>? data;
  int? codeState;

  Project({this.msg, this.data, this.codeState, });

  Project.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['codeState'] = codeState;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? name;
  String? description;
  String? state;

  Data({this.id, this.userId, this.name, this.description, this.state});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['description'] = description;
    data['state'] = state;
    return data;
  }
}