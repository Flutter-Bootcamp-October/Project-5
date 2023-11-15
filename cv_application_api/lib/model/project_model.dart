class Project {
  String? msg;
  List<ProjectData>? projectData;
  int? codeState;

  Project({this.msg, this.projectData, this.codeState});

  Project.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      projectData = <ProjectData>[];
      json['data'].forEach((v) {
        projectData!.add(new ProjectData.fromJson(v));
      });
    }
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.projectData != null) {
      data['data'] = this.projectData!.map((v) => v.toJson()).toList();
    }
    data['codeState'] = this.codeState;
    return data;
  }
}

class ProjectData {
  int? id;
  int? userId;
  String? name;
  String? description;
  String? state;

  ProjectData({this.id, this.userId, this.name, this.description, this.state});

  ProjectData.fromJson(Map<String, dynamic> json) {
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
