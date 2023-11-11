class Project {
  Project({
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

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['state'] = state;
    return data;
  }
}
