class ProjectData {
  ProjectData({
    required this.name,
    required this.description,
    required this.state,
  });
  late int id;
  late int userId;
  late String name;
  late String description;
  late String state;

  ProjectData.fromJson(Map<String, dynamic> json) {
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
