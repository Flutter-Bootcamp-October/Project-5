class Project {
  String? name;
  String? description;
  String? state;

  Project({this.name, this.description, this.state});

  Project.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['state'] = state;
    return data;
  }
}
