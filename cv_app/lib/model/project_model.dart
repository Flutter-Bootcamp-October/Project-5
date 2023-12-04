class ProjectModel {
  String? msg;
  SingleProject? data;
  int? codeState;

  ProjectModel({this.msg, this.data, this.codeState});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data =
        json['data'] != null ? new SingleProject.fromJson(json['data']) : null;
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['codeState'] = this.codeState;
    return data;
  }
}

class SingleProject {
  int? id;
  int? userId;
  String? name;
  String? description;
  String? state;

  SingleProject(
      {this.id, this.userId, this.name, this.description, this.state});

  SingleProject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['state'] = this.state;
    return data;
  }
}
