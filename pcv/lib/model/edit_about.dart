class AboutUser {
  String? msg;
  List<Data>? data;
  int? codeState;

  AboutUser({this.msg, this.data, this.codeState});

  AboutUser.fromJson(Map<String, dynamic> json) {
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
