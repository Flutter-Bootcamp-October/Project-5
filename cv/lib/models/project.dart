class Project {
  int? id;
  String? name;
  String? description;
  String? state;

  Project({this.id, this.name, this.description, this.state});

  Project.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    description = json['description'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['description'] = description;
    data['state'] = state;
    return data;
  }
}
