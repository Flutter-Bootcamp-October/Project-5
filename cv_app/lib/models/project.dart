class Project {
  int? id;
  int? userId;
  String? name;
  String? description;
  String? state;

  Project({this.id, this.userId, this.name, this.description, this.state});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['description'] = description;
    data['state'] = state;
    return data;
  }
}
